package Auth;

public interface AuthServiceInterface {
    String BAD_TEST_TOKEN = "bad_token";

    void authenticate(String token) throws AuthException;
}

