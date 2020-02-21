package Auth;

public interface AuthServiceInterface {
    void authenticate(String token) throws AuthException;
}

