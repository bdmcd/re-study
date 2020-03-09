//package DAO.DynamoDB;
//
//import DAO.Exception.DaoException;
//import DAO.UserDAOInterface;
//import Model.User;
//import Request.RegisterUserRequest;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//class UserDaoDynamoDBTest {
//
//    @Test
//    void registerUser() {
//        UserDAOInterface uDao = new UserDaoDynamoDB();
//        RegisterUserRequest request = new RegisterUserRequest();
//        request.setGuid("testGUID1");
//        request.setName("testName1");
//        User user = null;
//        try{
//            user = uDao.RegisterUser(request);
//        }catch (DaoException e){
//            e.printStackTrace();
//        }
//        assertNotNull(user);
//    }
//}