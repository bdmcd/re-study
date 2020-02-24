package Handler;

import Auth.AuthServiceInterface;
import Auth.FirebaseAuth.FirebaseTokenGenerator;
import Model.Set;
import Request.CreateSetRequest;
import Result.Codes;
import Result.CreateSetResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class CreateSetTests {
    @Test
    void createSetHandlerShouldReturnCorrectResponse() {
        String token = new FirebaseTokenGenerator().generateToken();

        CreateSetRequest request = new CreateSetRequest();
        request.setToken(token);
        request.setName("Set Name");
        request.setCreatorGuid("CreatorGuid");

        CreateSetResult result = new CreateSetHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.OK);
        assertEquals(result.getError(), null);
        assertNotEquals(result.getBody(), null);

        Set set = result.getBody();

        assertNotEquals(set.getGuid(), null);
        assertEquals(set.getCreatorGuid(), request.getCreatorGuid());
        assertEquals(set.getName(), request.getName());
    }

    @Test
    public void badTokenShouldReturnUnauthorizedCode() {
        String token = AuthServiceInterface.BAD_TEST_TOKEN;

        CreateSetRequest request = new CreateSetRequest();
        request.setToken(token);
        request.setName("Set Name");
        request.setCreatorGuid("CreatorGuid");

        CreateSetResult result = new CreateSetHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullTokenShouldReturnUnauthorizedCode() {
        CreateSetRequest request = new CreateSetRequest();
        request.setToken(null);
        request.setName("Set Name");
        request.setCreatorGuid("CreatorGuid");

        CreateSetResult result = new CreateSetHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullRequestShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();

        CreateSetResult result = new CreateSetHandler().HandleRequest(null);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullOrEmptyCreatorGuidShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        CreateSetRequest request = new CreateSetRequest();

        request.setCreatorGuid(null);
        request.setName("Test Set");
        request.setToken(token);

        CreateSetResult result = new CreateSetHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullOrEmptyNameShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        CreateSetRequest request = new CreateSetRequest();

        request.setCreatorGuid("test_uid");
        request.setName("");

        CreateSetResult result = new CreateSetHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }
}
