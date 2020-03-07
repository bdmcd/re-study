package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.CreateCardRequest;
import Result.Codes;
import Result.CreateCardResult;
import Result.CreateSetResult;
import Service.CreateCardService;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;


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
//            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            e.printStackTrace();
            return new CreateCardResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return CreateCardService.processRequest(request);
    }
}
