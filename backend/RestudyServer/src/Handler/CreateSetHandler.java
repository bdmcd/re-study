package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.CreateSetRequest;
import Result.Codes;
import Result.CreateSetResult;
import Service.CreateSetService;

public class CreateSetHandler {
    public CreateSetResult HandleRequest(CreateSetRequest request) {
        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            e.printStackTrace();
            return new CreateSetResult(Codes.UNAUTHORIZED, "User not authorized", null);
        }

        return CreateSetService.processRequest(request);
    }
}
