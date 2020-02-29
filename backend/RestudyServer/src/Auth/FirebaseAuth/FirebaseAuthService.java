package Auth.FirebaseAuth;

import Auth.AuthException;
import Auth.AuthServiceInterface;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;

import java.io.FileInputStream;

public class FirebaseAuthService implements AuthServiceInterface {

    @Override
    public void authenticate(String token) throws AuthException {
        try {
            FirebaseAppInitializer.initialize();

        } catch (java.io.FileNotFoundException e) {
            throw new AuthException("Error: Could not load the Firebase Configuration");
        } catch (java.io.IOException e) {
            throw new AuthException("Error: Could not set up the Firebase Credentials");
        }

        if (token == null || token.isEmpty()) {
            throw new AuthException("Error: Token cannot be null or empty");
        }

        try {
            FirebaseAuth.getInstance().verifyIdToken(token);
        } catch (FirebaseAuthException e) {
            System.out.println(e);
            throw new AuthException("Error: Invalid Token");
        }
    }
}

