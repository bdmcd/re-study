package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.CreateCardRequest;
import Result.Codes;
import Result.CreateCardResult;
import Service.CreateCardService;

public class CreateCardHandler {
    public CreateCardResult HandleRequest(CreateCardRequest request) {
        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            System.out.println(e);
            return new CreateCardResult(Codes.UNAUTHORIZED, "User not authorized", null);
        }

        return CreateCardService.processRequest(request);
    }
}
