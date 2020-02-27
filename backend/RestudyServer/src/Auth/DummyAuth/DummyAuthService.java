package Auth.DummyAuth;

import Auth.AuthException;
import Auth.AuthServiceInterface;

public class DummyAuthService implements AuthServiceInterface {
    @Override
    public void authenticate(String token) throws AuthException {
        if (token == null || token.isEmpty()) {
            throw new AuthException("Error: Invalid Token");
        } else if (token == BAD_TEST_TOKEN) {
            throw new AuthException("Error: Token cannot be null or empty");
        }
    }
}
