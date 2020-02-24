package Auth.FirebaseAuth;

import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;

public class FirebaseAuthServiceFactory implements AuthServiceFactoryInterface {

    @Override
    public AuthServiceInterface createAuthService() {
        return new FirebaseAuthService();
    }
}
