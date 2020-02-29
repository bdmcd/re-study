package Auth;

import Auth.FirebaseAuth.FirebaseAuthService;
import Auth.FirebaseAuth.FirebaseAuthServiceFactory;
import Auth.FirebaseAuth.FirebaseTokenGenerator;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class AuthTests {

    @Test
    public void firebaseTokenGeneratorShouldReturnToken() {
        FirebaseTokenGenerator tokenGenerator = new FirebaseTokenGenerator();
        String token = tokenGenerator.generateToken();

        assertNotEquals(token, null);
    }

    @Test
    public void firebaseAuthFactoryShouldReturnFirebaseAuthService() {
        AuthServiceFactoryInterface factory = new FirebaseAuthServiceFactory();
        AuthServiceInterface authService = factory.createAuthService();

        assertNotEquals(authService, null);
        assertTrue(authService instanceof FirebaseAuthService);
    }

    @Test
    public void validTokenShouldNotThrowError() {
        AuthServiceFactoryInterface factory = new FirebaseAuthServiceFactory();
        AuthServiceInterface authService = factory.createAuthService();

        FirebaseTokenGenerator tokenGenerator = new FirebaseTokenGenerator();
        String token = tokenGenerator.generateToken();

        assertDoesNotThrow(() -> {
            authService.authenticate(token);
        });
    }

    @Test
    public void invalidTokenShouldThrowError() {
        AuthServiceFactoryInterface factory = new FirebaseAuthServiceFactory();
        AuthServiceInterface authService = factory.createAuthService();

        assertThrows(AuthException.class, () -> {
            authService.authenticate(AuthServiceInterface.BAD_TEST_TOKEN);
        });

        assertThrows(AuthException.class, () -> {
            authService.authenticate(null);
        });
    }
}
