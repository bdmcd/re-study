package Auth.DummyAuth;

import Auth.AuthServiceFactoryInterface;
import Auth.AuthServiceInterface;

public class DummyAuthServiceFactory implements AuthServiceFactoryInterface {

    @Override
    public AuthServiceInterface createAuthService() {
        return new DummyAuthService();
    }
}
