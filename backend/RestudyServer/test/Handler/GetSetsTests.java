package Handler;

import Auth.AuthServiceInterface;
import Auth.FirebaseAuth.FirebaseTokenGenerator;
import Model.Set;
import Request.GetSetsRequest;
import Result.Codes;
import Result.GetSetsResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class GetSetsTests {
    @Test
    void getSetsHandlerShouldReturnCorrectResponse() {
        String token = new FirebaseTokenGenerator().generateToken();

        GetSetsRequest request = new GetSetsRequest();
        request.setToken(token);
        request.setUserGuid("test_uid");

        GetSetsResult result = new GetSetsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.OK);
        assertEquals(result.getError(), null);
        assertNotEquals(result.getBody(), null);

        Set[] sets = result.getBody();

        assertNotEquals(sets, null);

        for (Set set : sets) {
            assertEquals(set.getCreatorGuid(), request.getUserGuid());
        }
    }

    @Test
    public void badTokenShouldReturnUnauthorizedCode() {
        String token = AuthServiceInterface.BAD_TEST_TOKEN;

        GetSetsRequest request = new GetSetsRequest();

        request.setToken(token);
        request.setUserGuid("test_uid");

        GetSetsResult result = new GetSetsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullTokenShouldReturnUnauthorizedCode() {
        GetSetsRequest request = new GetSetsRequest();

        request.setToken(null);
        request.setUserGuid("test_uid");

        GetSetsResult result = new GetSetsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullRequestShouldReturnBadRequestCode() {
        GetSetsResult result = new GetSetsHandler().HandleRequest(null);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullOrEmptyUserGuidShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        GetSetsRequest request = new GetSetsRequest();

        request.setUserGuid(null);
        request.setToken(token);

        GetSetsResult result = new GetSetsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }
}
