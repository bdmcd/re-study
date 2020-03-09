//package Handler;
//
//import Auth.AuthServiceInterface;
//import Auth.FirebaseAuth.FirebaseTokenGenerator;
//import Model.Set;
//import Request.UpdateSetRequest;
//import Result.Codes;
//import Result.UpdateSetResult;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//public class UpdateSetTests {
//    @Test
//    void UpdateSetHandlerShouldReturnCorrectResponse() {
//        String token = new FirebaseTokenGenerator().generateToken();
//        UpdateSetRequest request = new UpdateSetRequest();
//
//        request.setToken(token);
//        request.setName("Set Name");
//        request.setGuid("set_guid");
//
//        UpdateSetResult result = new UpdateSetHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.OK);
//        assertEquals(result.getError(), null);
//        assertNotEquals(result.getBody(), null);
//
//        Set set = result.getBody();
//
//        assertNotEquals(set.getCreatorGuid(), null);
//        assertEquals(set.getCreatorGuid().isEmpty(), false);
//        assertEquals(set.getGuid(), request.getGuid());
//        assertEquals(set.getName(), request.getName());
//    }
//
//    @Test
//    public void badTokenShouldReturnUnauthorizedCode() {
//        String token = AuthServiceInterface.BAD_TEST_TOKEN;
//        UpdateSetRequest request = new UpdateSetRequest();
//
//        request.setToken(token);
//        request.setName("Set Name");
//        request.setGuid("set_guid");
//
//        UpdateSetResult result = new UpdateSetHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullTokenShouldReturnUnauthorizedCode() {
//        UpdateSetRequest request = new UpdateSetRequest();
//
//        request.setToken(null);
//        request.setName("Set Name");
//        request.setGuid("set_guid");
//
//        UpdateSetResult result = new UpdateSetHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullRequestShouldReturnBadRequestCode() {
//        UpdateSetResult result = new UpdateSetHandler().HandleRequest(null);
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
//        UpdateSetRequest request = new UpdateSetRequest();
//
//        request.setGuid(null);
//        request.setName("Test Set");
//        request.setToken(token);
//
//        UpdateSetResult result = new UpdateSetHandler().HandleRequest(request);
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
//        UpdateSetRequest request = new UpdateSetRequest();
//
//        request.setGuid("set_guid");
//        request.setName("");
//
//        UpdateSetResult result = new UpdateSetHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//}
