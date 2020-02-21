package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.RegisterUserRequest;
import Result.Codes;
import Result.RegisterUserResult;
import Service.RegisterUserService;

public class RegisterUserHandler {
    public RegisterUserResult HandleRequest(RegisterUserRequest request) {
        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            e.printStackTrace();
            return new RegisterUserResult(Codes.UNAUTHORIZED, "User not authorized", null);
        }

        return RegisterUserService.processRequest(request);
    }
}
