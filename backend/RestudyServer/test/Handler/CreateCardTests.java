//package Handler;
//
//import Auth.AuthServiceInterface;
//import Auth.FirebaseAuth.FirebaseTokenGenerator;
//import Model.Card;
//import Request.CreateCardRequest;
//import Result.Codes;
//import Result.CreateCardResult;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//public class CreateCardTests {
//    @Test
//    public void createCardHandlerShouldReturnCorrectResponse() {
//        String token = new FirebaseTokenGenerator().generateToken();
//
//        CreateCardRequest request = new CreateCardRequest();
//        request.setToken(token);
//        request.setQuestion("Question");
//        request.setAnswer("Answer");
//        request.setSetGuid("SetGuid");
//        request.setCreatorGuid("creGudi");
//
//        CreateCardResult result = new CreateCardHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.OK);
//        assertEquals(result.getError(), null);
//        assertNotEquals(result.getBody(), null);
//
//        Card card = result.getBody();
//
//        assertEquals(card.getAnswer(), request.getAnswer());
//        assertEquals(card.getQuestion(), request.getQuestion());
//        assertEquals(card.getSetGuid(), request.getSetGuid());
//    }
//
//    @Test
//    public void badTokenShouldReturnUnauthorizedCode() {
//        String token = AuthServiceInterface.BAD_TEST_TOKEN;
//
//        CreateCardRequest request = new CreateCardRequest();
//        request.setToken(token);
//        request.setQuestion("Question");
//        request.setAnswer("Answer");
//        request.setSetGuid("SetGuid");;
//
//        CreateCardResult result = new CreateCardHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullTokenShouldReturnUnauthorizedCode() {
//        CreateCardRequest request = new CreateCardRequest();
//        request.setToken(null);
//        request.setQuestion("Question");
//        request.setAnswer("Answer");
//        request.setSetGuid("SetGuid");
//
//        CreateCardResult result = new CreateCardHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.UNAUTHORIZED);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullOrEmptyQuestionShouldReturnBadRequestCode() {
//        String token = new FirebaseTokenGenerator().generateToken();
//        CreateCardRequest request = new CreateCardRequest();
//
//        request.setToken(token);
//        request.setQuestion(null);
//        request.setAnswer("Answer");
//        request.setSetGuid("SetGuid");
//
//        CreateCardResult result = new CreateCardHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//    @Test
//    public void nullOrEmptyAnswerShouldReturnBadRequestCode() {
//        String token = new FirebaseTokenGenerator().generateToken();
//        CreateCardRequest request = new CreateCardRequest();
//
//        request.setToken(token);
//        request.setQuestion("Question");
//        request.setAnswer("");
//        request.setSetGuid("SetGuid");
//
//        CreateCardResult result = new CreateCardHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//
//
//    @Test
//    public void nullOrEmptySetGuidShouldReturnBadRequestCode() {
//        String token = new FirebaseTokenGenerator().generateToken();
//        CreateCardRequest request = new CreateCardRequest();
//
//        request.setToken(token);
//        request.setQuestion("Question");
//        request.setAnswer("Answer");
//        request.setSetGuid("");
//
//        CreateCardResult result = new CreateCardHandler().HandleRequest(request);
//
//        assertNotEquals(result, null);
//        assertEquals(result.getStatusCode(), Codes.BAD_REQUEST);
//        assertNotEquals(result.getError(), null);
//        assertEquals(result.getBody(), null);
//    }
//}
