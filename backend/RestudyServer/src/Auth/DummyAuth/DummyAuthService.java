package Auth.DummyAuth;

import Auth.AuthException;
import Auth.AuthServiceInterface;

public class DummyAuthService implements AuthServiceInterface {

    @Override
    public void authenticate(String token) throws AuthException {

    }
}
