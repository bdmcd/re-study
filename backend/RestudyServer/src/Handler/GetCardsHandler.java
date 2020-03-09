package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.GetCardsRequest;
import Result.Codes;
import Result.GetCardsResult;
import Service.GetCardsService;
import com.amazonaws.services.lambda.runtime.Context;

public class GetCardsHandler {
    public GetCardsResult HandleRequest(GetCardsRequest request, Context context) {
        if (request == null) {
            return new GetCardsResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getSetGuid() == null || request.getSetGuid().isEmpty()) {
            return new GetCardsResult(Codes.BAD_REQUEST, "Request SetGuid cannot be null or empty");
        }

        try {
            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            //TODO: Log the exception here
            return new GetCardsResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return GetCardsService.processRequest(request);
    }
}
