package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.UpdateSetRequest;
import Result.Codes;
import Result.UpdateSetResult;
import Service.UpdateSetService;

public class UpdateSetHandler {
    public UpdateSetResult HandleRequest(UpdateSetRequest request) {
        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            e.printStackTrace();
            return new UpdateSetResult(Codes.UNAUTHORIZED, "User not authorized", null);
        }

        return UpdateSetService.processRequest(request);
    }
}
