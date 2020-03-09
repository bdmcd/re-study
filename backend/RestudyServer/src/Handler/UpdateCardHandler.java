package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.UpdateCardRequest;
import Result.Codes;
import Result.UpdateCardResult;
import Service.UpdateCardService;
import com.amazonaws.services.lambda.runtime.Context;

public class UpdateCardHandler {
    public UpdateCardResult HandleRequest(UpdateCardRequest request, Context context) {

        if (request == null) {
            return new UpdateCardResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getGuid() == null || request.getAnswer().isEmpty()) {
            return new UpdateCardResult(Codes.BAD_REQUEST, "Request Guid cannot be null or empty");
        } else if (request.getSetGuid() == null || request.getSetGuid().isEmpty()) {
            return new UpdateCardResult(Codes.BAD_REQUEST, "Request SetGuid cannot be null or empty");
        } else if (request.getQuestion() == null || request.getQuestion().isEmpty()) {
            return new UpdateCardResult(Codes.BAD_REQUEST, "Request Question cannot be null or empty");
        } else if (request.getAnswer() == null || request.getAnswer().isEmpty()) {
            return new UpdateCardResult(Codes.BAD_REQUEST, "Request Answer cannot be null or empty");
        }

        try {
            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
<<<<<<< Updated upstream
//            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
=======
>>>>>>> Stashed changes
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            //TODO: Log the exception here
            return new UpdateCardResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return UpdateCardService.processRequest(request);
    }
}
