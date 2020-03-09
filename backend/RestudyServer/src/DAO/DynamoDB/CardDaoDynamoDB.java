package DAO.DynamoDB;

import DAO.CardDaoInterface;
import Model.Card;
import Request.CreateCardRequest;
import Request.GetCardsRequest;
import Request.UpdateCardRequest;
import Result.CreateCardResult;
import Result.GetCardsResult;
import Result.UpdateCardResult;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Item;
import com.amazonaws.services.dynamodbv2.document.Table;
import com.amazonaws.services.dynamodbv2.document.spec.DeleteItemSpec;
import com.amazonaws.services.dynamodbv2.model.*;

import java.util.*;

public class CardDaoDynamoDB implements CardDaoInterface {
    private static String tableName = "card";
    private static String guidAttr = "guid";
    private static String setGuidAttr = "setGuid";
    private static String creatorGuidAttr = "creatorGuid";
    private static String answerAttr = "answer";
    private static String questionAttr = "question";
    private static String nextSessionAttr = "nextSession";
    private static String nextIncrementAttr = "nextIncrement";
    private static String deletedAttr = "deleted";


    // DynamoDB client
    private static AmazonDynamoDB amazonDynamoDB = AmazonDynamoDBClientBuilder
            .standard()
            .withRegion("us-west-2")
            .build();
    private static DynamoDB dynamoDB = new DynamoDB(amazonDynamoDB);

    @Override
    public Card CreateCard(CreateCardRequest request) {
        Table table = dynamoDB.getTable(tableName);

        try {
            String uuid = UUID.randomUUID().toString();
            Item item = new Item().withPrimaryKey(guidAttr, uuid,
                    setGuidAttr, request.getSetGuid())
                    .withString(creatorGuidAttr, request.getCreatorGuid())
                    .withString(answerAttr, request.getAnswer())
                    .withString(questionAttr, request.getQuestion())
                    .withLong(nextSessionAttr, 0) //TODO implement the today set
                    .withLong(nextIncrementAttr, 0) //TODO implement the today set
                    .withBoolean(deletedAttr, false);
            table.putItem(item);

            Card card = new Card();
            card.setAnswer(request.getAnswer());
            card.setDeleted(false);
            card.setGuid(uuid);
            card.setSetGuid(request.getSetGuid());
            card.setQuestion(request.getQuestion());
            return card;

        } catch(Exception e) {
            System.out.println(e.getMessage()); //Todo change to lambda logger
            return null;
        }
    }

    @Override
    public Card UpdateCard(UpdateCardRequest request) {
        Map<String, AttributeValue> attributeValues = new HashMap<>();
        attributeValues.put(guidAttr,new AttributeValue().withS(request.getGuid()));
        attributeValues.put(setGuidAttr,new AttributeValue().withS(request.getSetGuid()));

        Map<String, AttributeValueUpdate> attributeValuesUpdate = new HashMap<>();
        // cannot update the setGuid because it is part of the key. (could delete the card and recreate it?)
        if (!request.getSetGuid().equals(request.getNewSetGuid())) {
            try {
                Table table = dynamoDB.getTable(tableName);
                DeleteItemSpec spec = new DeleteItemSpec().withPrimaryKey(guidAttr, request.getGuid(), setGuidAttr, request.getSetGuid());
                table.deleteItem(spec);

                attributeValues = new HashMap<>();
                attributeValues.put(guidAttr,new AttributeValue().withS(request.getGuid()));
                attributeValues.put(setGuidAttr,new AttributeValue().withS(request.getNewSetGuid()));
            }
            catch (Exception e) {
                //todo log with lambdda logger.
            }
        }

        attributeValuesUpdate.put(answerAttr, new AttributeValueUpdate().withValue(new AttributeValue().withS(request.getAnswer())));
        attributeValuesUpdate.put(questionAttr, new AttributeValueUpdate().withValue(new AttributeValue().withS(request.getQuestion())));
        attributeValuesUpdate.put(nextSessionAttr, new AttributeValueUpdate().withValue(new AttributeValue().withN("10"))); //todo add the increments for smart schedueling
        attributeValuesUpdate.put(nextIncrementAttr, new AttributeValueUpdate().withValue(new AttributeValue().withN("10"))); //todo add the increments for smart schedualing
        attributeValuesUpdate.put(deletedAttr, new AttributeValueUpdate().withValue(new AttributeValue().withBOOL(request.isDeleted())));
        // note that the creator card Guid or the creator guid will never be updated.

        UpdateItemRequest updateItemRequest = new UpdateItemRequest(tableName, attributeValues, attributeValuesUpdate);
        amazonDynamoDB.updateItem(updateItemRequest);

        Card card = new Card();
        card.setAnswer(request.getAnswer());
        card.setDeleted(request.isDeleted());
        card.setGuid(request.getGuid());
        card.setSetGuid(request.getGuid()); //todo we need the set guid as well.
        card.setQuestion(request.getQuestion());

        return card;
    }

    @Override
    public Card[] GetCards(GetCardsRequest request) {
        //todo if setguid  = "todaysetuid" get the sets for today. the creator guid index table needed.
        Map<String, String> attrNames = new TreeMap<>();
        attrNames.put("#set", setGuidAttr);

        Map<String, AttributeValue> attrValues = new TreeMap<>();
        attrValues.put(":setGuid", new AttributeValue().withS(request.getSetGuid()));

        QueryRequest queryRequest = new QueryRequest()
                .withTableName(tableName)
                .withKeyConditionExpression("#set = :setGuid")
                .withExpressionAttributeNames(attrNames)
                .withExpressionAttributeValues(attrValues)
                .withScanIndexForward(false);

        QueryResult queryResult = amazonDynamoDB.query(queryRequest);
        List<Map<String, AttributeValue>> items = queryResult.getItems();
        List<Card> cardList = new ArrayList<>();
        if (items != null) {
            for (Map<String, AttributeValue> item : items) {
                Card card = new Card();
                card.setGuid(item.get(guidAttr).getS());
                card.setSetGuid(item.get(setGuidAttr).getS());
                card.setQuestion(item.get(questionAttr).getS());
                card.setAnswer(item.get(answerAttr).getS());
                card.setDeleted(item.get(deletedAttr).getBOOL());
                //todo ? if !deleted ?
                cardList.add(card);
            }
        }

        Card[] newCardList = new Card[cardList.size()];
        for(int i = 0; i < cardList.size(); i++){
            newCardList[i] = cardList.get(i);
        }
        return newCardList;
    }
}
