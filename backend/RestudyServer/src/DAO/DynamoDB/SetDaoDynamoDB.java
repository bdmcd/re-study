package DAO.DynamoDB;

import DAO.SetDaoInterface;
import Model.Set;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;
import Result.CreateSetResult;
import Result.GetSetsResult;
import Result.UpdateSetResult;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Item;
import com.amazonaws.services.dynamodbv2.document.Table;
import com.amazonaws.services.dynamodbv2.model.*;

import java.util.*;

public class SetDaoDynamoDB  implements SetDaoInterface {
    private static String tableName = "set";
    private static String creatorGuidAttr = "creatorGuid";
    private static String guidAttr = "guid";
    private static String nameAttr = "name";

    // DynamoDB client
    private static AmazonDynamoDB amazonDynamoDB = AmazonDynamoDBClientBuilder
            .standard()
            .withRegion("us-west-2")
            .build();
    private static DynamoDB dynamoDB = new DynamoDB(amazonDynamoDB);

    @Override
    public Set CreateSet(CreateSetRequest request) {
        Table table = dynamoDB.getTable(tableName);
        String uuid = UUID.randomUUID().toString();
        try {
            Item item = new Item().withPrimaryKey(creatorGuidAttr, request.getCreatorGuid(), guidAttr, uuid)
                    .withString(nameAttr, request.getName());
            table.putItem(item);
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        Set set = new Set();
        set.setCreatorGuid(request.getCreatorGuid());
        set.setGuid(uuid);
        set.setName(request.getName());
        return set;
    }

    @Override
    public Set UpdateSet(UpdateSetRequest request) {
        Map<String, AttributeValue> attributeValues = new HashMap<>();
        attributeValues.put(guidAttr,new AttributeValue().withS(request.getGuid()));
        attributeValues.put(creatorGuidAttr,new AttributeValue().withS(request.getCreatorGuid()));

        Map<String, AttributeValueUpdate> attributeValuesUpdate = new HashMap<>();

        attributeValuesUpdate.put(nameAttr, new AttributeValueUpdate().withValue(new AttributeValue().withS(request.getName())));


        UpdateItemRequest updateItemRequest = new UpdateItemRequest(tableName, attributeValues, attributeValuesUpdate);
        amazonDynamoDB.updateItem(updateItemRequest);

        Set set = new Set();
        set.setGuid(request.getGuid());
        set.setCreatorGuid(request.getCreatorGuid());
        set.setName(request.getName());

        return set;
    }

    @Override
    public Set[] GetSets(GetSetsRequest request) {
        Map<String, String> attrNames = new TreeMap<>();
        attrNames.put("#creator", creatorGuidAttr);

        Map<String, AttributeValue> attrValues = new TreeMap<>();
        attrValues.put(":creatorGuid", new AttributeValue().withS(request.getUserGuid()));

        QueryRequest queryRequest = new QueryRequest()
                .withTableName(tableName)
                .withKeyConditionExpression("#creator = :creatorGuid")
                .withExpressionAttributeNames(attrNames)
                .withExpressionAttributeValues(attrValues)
                .withScanIndexForward(false);

        QueryResult queryResult = amazonDynamoDB.query(queryRequest);
        List<Map<String, AttributeValue>> items = queryResult.getItems();
        List<Set> setList = new ArrayList<>();
        if (items != null) {
            for (Map<String, AttributeValue> item : items) {
                Set set = new Set();
                set.setGuid(item.get(guidAttr).getS());
                set.setCreatorGuid(item.get(creatorGuidAttr).getS());
                set.setName(item.get(nameAttr).getS());
                setList.add(set);
            }
        }

        Set[] newSetList = new Set[setList.size()];
        for(int i = 0; i < setList.size(); i++){
            newSetList[i] = setList.get(i);
        }
        return newSetList;
    }
}
