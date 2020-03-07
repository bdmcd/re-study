package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.CreateSetRequest;
import Result.Codes;
import Result.CreateSetResult;
import Service.CreateSetService;

public class CreateSetHandler {
    public CreateSetResult HandleRequest(CreateSetRequest request) {
        if (request == null) {
            return new CreateSetResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getCreatorGuid() == null || request.getCreatorGuid().isEmpty()) {
            return new CreateSetResult(Codes.BAD_REQUEST, "Request CreatorGuid cannot be null or empty");
        } else if (request.getName() == null || request.getName().isEmpty()) {
            return new CreateSetResult(Codes.BAD_REQUEST, "Request Name cannot be null or empty");
        }

        try {
            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
//            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            //TODO: Log the exception here
            return new CreateSetResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return CreateSetService.processRequest(request);
    }
}
