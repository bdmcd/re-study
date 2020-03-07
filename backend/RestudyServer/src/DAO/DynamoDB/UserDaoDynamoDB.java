package DAO.DynamoDB;

import DAO.UserDAOInterface;
import Model.User;
import Request.RegisterUserRequest;
import Result.RegisterUserResult;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Item;
import com.amazonaws.services.dynamodbv2.document.Table;

public class UserDaoDynamoDB implements UserDAOInterface {
    private static String tableName = "user";
    private static String guidAttr = "guid";
    private static String nameAttr = "name";

    // DynamoDB client
    private static AmazonDynamoDB amazonDynamoDB = AmazonDynamoDBClientBuilder
            .standard()
            .withRegion("us-west-2")
            .build();
    private static DynamoDB dynamoDB = new DynamoDB(amazonDynamoDB);

    @Override
    public User RegisterUser(RegisterUserRequest Request) {
        Table table = dynamoDB.getTable(tableName);
        User user = new User();
        try {
            Item item = new Item().withPrimaryKey(guidAttr, Request.getGuid())
                    .withString(nameAttr, Request.getName());
            table.putItem(item);
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        user.setGuid(Request.getGuid());
        user.setName(Request.getName());
        return user;
    }
}
