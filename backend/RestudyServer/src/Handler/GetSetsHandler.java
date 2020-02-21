package Handler;

import Auth.AuthException;
import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;
import Auth.DummyAuth.DummyAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Request.GetSetsRequest;
import Result.Codes;
import Result.GetSetsResult;
import Service.GetSetsService;

public class GetSetsHandler {
    public GetSetsResult HandleRequest(GetSetsRequest request) {
        try {
//            AuthServiceFactoryInterface authFactory = new FirebaseAuthServiceFactory();
            AuthServiceFactoryInterface authFactory = new DummyAuthServiceFactory();
            authFactory.createAuthService().authenticate(request.getToken());
        } catch(AuthException e) {
            System.out.println(e);
            return new GetSetsResult(Codes.UNAUTHORIZED, "User not authorized", null);
        }

        return GetSetsService.processRequest(request);
    }
}
