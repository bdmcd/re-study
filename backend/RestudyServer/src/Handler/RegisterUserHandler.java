package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.RegisterUserRequest;
import Result.Codes;
import Result.RegisterUserResult;
import Service.RegisterUserService;

public class RegisterUserHandler {
    public RegisterUserResult HandleRequest(RegisterUserRequest request) {
        if (request == null) {
            return new RegisterUserResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getGuid() == null || request.getGuid().isEmpty()) {
            return new RegisterUserResult(Codes.BAD_REQUEST, "Request Guid cannot be null or empty");
        } else if (request.getName() == null || request.getName().isEmpty()) {
            return new RegisterUserResult(Codes.BAD_REQUEST, "Request Name cannot be null or empty");
        }

        try {
            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
//            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            //TODO: Log the exception here
            return new RegisterUserResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return RegisterUserService.processRequest(request);
    }
}
