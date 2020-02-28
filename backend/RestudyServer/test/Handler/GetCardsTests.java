package Handler;

import Auth.AuthServiceInterface;
import Auth.FirebaseAuth.FirebaseTokenGenerator;
import Model.Card;
import Request.GetCardsRequest;
import Result.Codes;
import Result.GetCardsResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

public class GetCardsTests {
    @Test
    void getCardsHandlerShouldReturnCorrectResponse() {
        String token = new FirebaseTokenGenerator().generateToken();

        GetCardsRequest request = new GetCardsRequest();
        request.setToken(token);
        request.setSetGuid("set_guid");

        GetCardsResult result = new GetCardsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.OK);
        assertEquals(result.getError(), null);
        assertNotEquals(result.getBody(), null);

        Card[] cards = result.getBody();

        for (Card card : cards) {
            assertNotEquals(card.getGuid(), null);
//            assertNotEquals(card.getSetName(), null);
            assertNotEquals(card.getSetGuid(), null);
            assertNotEquals(card.getAnswer(), null);
//            assertNotEquals(card.getSetName(), null);
            assertNotEquals(card.getQuestion(), null);
            assertNotEquals(card.getAnswer(), null);

            assertEquals(card.getGuid().isEmpty(), false);
//            assertEquals(card.getSetName().isEmpty(), false);
            assertEquals(card.getSetGuid().isEmpty(), false);
            assertEquals(card.getAnswer().isEmpty(), false);
//            assertEquals(card.getSetName().isEmpty(), false);
            assertEquals(card.getQuestion().isEmpty(), false);
            assertEquals(card.getAnswer().isEmpty(), false);

            assertEquals(card.getSetGuid(), request.getSetGuid());
        }
    }

    @Test
    public void badTokenShouldReturnUnauthorizedCode() {
        String token = AuthServiceInterface.BAD_TEST_TOKEN;

        GetCardsRequest request = new GetCardsRequest();
        request.setToken(token);
        request.setSetGuid("set_guid");

        GetCardsResult result = new GetCardsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullTokenShouldReturnUnauthorizedCode() {
        GetCardsRequest request = new GetCardsRequest();
        request.setToken(null);
        request.setSetGuid("set_guid");

        GetCardsResult result = new GetCardsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullRequestShouldReturnBadRequestCode() {
        GetCardsResult result = new GetCardsHandler().HandleRequest(null);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullOrEmptySetGuidShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        GetCardsRequest request = new GetCardsRequest();

        request.setToken(token);
        request.setSetGuid(null);

        GetCardsResult result = new GetCardsHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }
}
