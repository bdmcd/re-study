package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.GetSetsRequest;
import Result.Codes;
import Result.GetSetsResult;
import Service.GetSetsService;

public class GetSetsHandler {
    public GetSetsResult HandleRequest(GetSetsRequest request) {
        if (request == null) {
            return new GetSetsResult(Codes.BAD_REQUEST, "Received null request");
        } else if (request.getUserGuid() == null || request.getUserGuid().isEmpty()) {
            return new GetSetsResult(Codes.BAD_REQUEST, "Request UserGuid cannot be null or empty");
        }

        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            //TODO: Log the exception here
            return new GetSetsResult(Codes.UNAUTHORIZED, "User not authorized");
        }

        return GetSetsService.processRequest(request);
    }
}
