package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.GetCardsRequest;
import Result.Codes;
import Result.GetCardsResult;
import Service.GetCardsService;

public class GetCardsHandler {
    public GetCardsResult HandleRequest(GetCardsRequest request) {
        try {
            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
//            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            e.printStackTrace();
            return new GetCardsResult(Codes.UNAUTHORIZED, "User not authorized", null);
        }

        return GetCardsService.processRequest(request);
    }
}
