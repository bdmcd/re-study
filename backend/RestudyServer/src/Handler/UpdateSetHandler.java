package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.UpdateSetRequest;
import Result.Codes;
import Result.UpdateSetResult;
import Service.UpdateSetService;
import com.amazonaws.services.lambda.runtime.Context;

public class UpdateSetHandler {
    public UpdateSetResult HandleRequest(UpdateSetRequest request, Context context) {
        if (request == null) {
            return new UpdateSetResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getGuid() == null || request.getGuid().isEmpty()) {
            return new UpdateSetResult(Codes.BAD_REQUEST, "Request Guid cannot be null or empty");
        } else if (request.getName() == null || request.getName().isEmpty()) {
            return new UpdateSetResult(Codes.BAD_REQUEST, "Request Name cannot be null or empty");
        }

        try {
            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            //TODO: Log the exception here
            return new UpdateSetResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return UpdateSetService.processRequest(request);
    }
}
