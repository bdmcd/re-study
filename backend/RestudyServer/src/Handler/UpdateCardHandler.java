package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.UpdateCardRequest;
import Result.Codes;
import Result.UpdateCardResult;
import Service.UpdateCardService;

public class UpdateCardHandler {
    public UpdateCardResult HandleRequest(UpdateCardRequest request) {
        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            e.printStackTrace();
            return new UpdateCardResult(Codes.UNAUTHORIZED, "User not authorized", null);
        }

        return UpdateCardService.processRequest(request);
    }
}
