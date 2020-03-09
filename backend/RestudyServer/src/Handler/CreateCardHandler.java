package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.CreateCardRequest;
import Result.Codes;
import Result.CreateCardResult;
import Service.CreateCardService;

public class CreateCardHandler {
    public CreateCardResult HandleRequest(CreateCardRequest request) {
        if (request == null) {
            return new CreateCardResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getSetGuid() == null || request.getSetGuid().isEmpty()) {
            return new CreateCardResult(Codes.BAD_REQUEST, "Request SetGuid cannot be null or empty");
        } else if (request.getQuestion() == null || request.getQuestion().isEmpty()) {
            return new CreateCardResult(Codes.BAD_REQUEST, "Request Question cannot be null or empty");
        } else if (request.getAnswer() == null || request.getAnswer().isEmpty()) {
            return new CreateCardResult(Codes.BAD_REQUEST, "Request Answer cannot be null or empty");
        }

        try {
            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            //TODO: Log the exception here
            return new CreateCardResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return CreateCardService.processRequest(request);
    }
}
