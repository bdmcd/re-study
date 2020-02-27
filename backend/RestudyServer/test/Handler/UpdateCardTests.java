package Handler;

import Auth.AuthServiceInterface;
import Auth.FirebaseAuth.FirebaseTokenGenerator;
import Model.Card;
import Request.UpdateCardRequest;
import Result.Codes;
import Result.UpdateCardResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

public class UpdateCardTests {
    @Test
    public void updateCardHandlerShouldReturnCorrectResponse() {
        String token = new FirebaseTokenGenerator().generateToken();

        UpdateCardRequest request = new UpdateCardRequest();
        request.setToken(token);
        request.setGuid("card_guid");
        request.setQuestion("Question");
        request.setAnswer("Answer");
        request.setSetGuid("SetGuid");
        request.setDeleted(true);

        UpdateCardResult result = new UpdateCardHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.OK);
        assertEquals(result.getError(), null);
        assertNotEquals(result.getBody(), null);

        Card card = result.getBody();

        assertEquals(card.getGuid(), request.getGuid());
        assertEquals(card.getAnswer(), request.getAnswer());
        assertEquals(card.getQuestion(), request.getQuestion());
        assertEquals(card.getSetGuid(), request.getSetGuid());
        assertEquals(card.isDeleted(), request.isDeleted());
    }

    @Test
    public void badTokenShouldReturnUnauthorizedCode() {
        String token = AuthServiceInterface.BAD_TEST_TOKEN;

        UpdateCardRequest request = new UpdateCardRequest();
        request.setToken(token);
        request.setGuid("card_guid");
        request.setQuestion("Question");
        request.setAnswer("Answer");
        request.setSetGuid("SetGuid");
        request.setDeleted(true);

        UpdateCardResult result = new UpdateCardHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullTokenShouldReturnUnauthorizedCode() {
        UpdateCardRequest request = new UpdateCardRequest();
        request.setToken(null);
        request.setGuid("card_guid");
        request.setQuestion("Question");
        request.setAnswer("Answer");
        request.setSetGuid("SetGuid");
        request.setDeleted(true);

        UpdateCardResult result = new UpdateCardHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullOrEmptyGuidShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        UpdateCardRequest request = new UpdateCardRequest();

        request.setToken(token);
        request.setGuid(null);
        request.setQuestion("Question");
        request.setAnswer("Answer");
        request.setSetGuid("SetGuid");
        request.setDeleted(true);

        UpdateCardResult result = new UpdateCardHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullOrEmptyQuestionShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        UpdateCardRequest request = new UpdateCardRequest();

        request.setToken(token);
        request.setGuid("card_guid");
        request.setQuestion(null);
        request.setAnswer("Answer");
        request.setSetGuid("SetGuid");
        request.setDeleted(true);

        UpdateCardResult result = new UpdateCardHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }

    @Test
    public void nullOrEmptyAnswerShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        UpdateCardRequest request = new UpdateCardRequest();


        request.setToken(token);
        request.setGuid("card_guid");
        request.setQuestion("Question");
        request.setAnswer("");
        request.setSetGuid("SetGuid");
        request.setDeleted(true);

        UpdateCardResult result = new UpdateCardHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }


    @Test
    public void nullOrEmptySetGuidShouldReturnBadRequestCode() {
        String token = new FirebaseTokenGenerator().generateToken();
        UpdateCardRequest request = new UpdateCardRequest();

        request.setToken(token);
        request.setGuid("card_guid");
        request.setQuestion("Question");
        request.setAnswer("Answer");
        request.setSetGuid("");
        request.setDeleted(true);

        UpdateCardResult result = new UpdateCardHandler().HandleRequest(request);

        assertNotEquals(result, null);
        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
        assertNotEquals(result.getError(), null);
        assertEquals(result.getBody(), null);
    }
}
