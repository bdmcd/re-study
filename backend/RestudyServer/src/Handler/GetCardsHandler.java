package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.GetCardsRequest;
import Result.Codes;
import Result.GetCardsResult;
import Service.GetCardsService;

public class GetCardsHandler {
    public GetCardsResult HandleRequest(GetCardsRequest request) {
        if (request == null) {
            return new GetCardsResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getSetGuid() == null || request.getSetGuid().isEmpty()) {
            return new GetCardsResult(Codes.BAD_REQUEST, "Request SetGuid cannot be null or empty");
        }

//        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
////            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
//            authFactory.createAuthService().authenticate(request.getToken());
//        } catch(AuthException e) {
//            //TODO: Log the exception here
//            return new GetCardsResult(Codes.UNAUTHORIZED, "User not authorized");
//        }

        return GetCardsService.processRequest(request);
    }
}
