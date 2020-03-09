//package Handler;
//
//import Auth.AuthServiceInterface;
//import Auth.FirebaseAuth.FirebaseTokenGenerator;
//import Model.User;
//import Request.RegisterUserRequest;
//import Result.Codes;
//import Result.RegisterUserResult;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//import static org.junit.jupiter.api.Assertions.assertNotEquals;
//
//public class RegisterUserTests {
//    @Test
//    public void registerUserHandlerShouldReturnCorrectResponse() {
//        String token = new FirebaseTokenGenerator().generateToken();
//
//        RegisterUserRequest request = new RegisterUserRequest();
//        request.setGuid("test_uid");
//        request.setName("John Doe");
//        request.setToken(token);
//
//        RegisterUserResult result = new RegisterUserHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.OK);
//        assertEquals(result.getError(), null);
//        assertNotEquals(result.getBody(), null);
//
//        User user = result.getBody();
//
//        assertEquals(user.getGuid(), request.getGuid());
//        assertEquals(user.getName(), request.getName());
//    }
//
//    @Test
//    public void badTokenShouldReturnUnauthorizedCode() {
//        String token = AuthServiceInterface.BAD_TEST_TOKEN;
//
//        RegisterUserRequest request = new RegisterUserRequest();
//        request.setGuid("test_uid");
//        request.setName("John Doe");
//        request.setToken(token);
//
//        RegisterUserResult result = new RegisterUserHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullTokenShouldReturnUnauthorizedCode() {
//        RegisterUserRequest request = new RegisterUserRequest();
//        request.setGuid("test_uid");
//        request.setName("John Doe");
//        request.setToken(null);
//
//        RegisterUserResult result = new RegisterUserHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullRequestShouldReturnBadRequestCode() {
//        RegisterUserResult result = new RegisterUserHandler().HandleRequest(null);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullOrEmptyGuidShouldReturnBadRequestCode() {
//        String token = new FirebaseTokenGenerator().generateToken();
//        RegisterUserRequest request = new RegisterUserRequest();
//
//        request.setGuid("");
//        request.setName("John Doe");
//        request.setToken(token);
//
//        RegisterUserResult result = new RegisterUserHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullOrEmptyNameShouldReturnBadRequestCode() {
//        String token = new FirebaseTokenGenerator().generateToken();
//
//        RegisterUserRequest request = new RegisterUserRequest();
//        request.setToken(token);
//        request.setGuid("test_uid");
//        request.setName(null);
//
//        RegisterUserResult result = new RegisterUserHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//}
