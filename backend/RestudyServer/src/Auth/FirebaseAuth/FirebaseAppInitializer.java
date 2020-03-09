package Auth.FirebaseAuth;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

public class FirebaseAppInitializer {
    private static boolean isInitialized;
    private static String apiKey;

    public static void initialize() throws IOException {
        if (!isInitialized) {
            apiKey = readApiKey();

            InputStream serviceAccount =
                    FirebaseAppInitializer.class.getResourceAsStream("/firebase/restudy-fe85d-firebase-adminsdk-6v08x-498efd7c8e.json");

            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setDatabaseUrl("https://restudy-fe85d.firebaseio.com")
                    .build();

            FirebaseApp.initializeApp(options);

            isInitialized = true;
        }
    }

    private static String readApiKey() throws FileNotFoundException {
<<<<<<< Updated upstream
        File apiKeyFile = new File("./firebase/api-key.txt");
        Scanner apiKeyScanner = new Scanner(apiKeyFile);
=======
        InputStream apiKeyStream =
                FirebaseAppInitializer.class.getResourceAsStream("/firebase/api-key.txt");

        Scanner apiKeyScanner = new Scanner(apiKeyStream);
>>>>>>> Stashed changes
        String apiKey = apiKeyScanner.useDelimiter("\\A").next();
        apiKeyScanner.close();

        return apiKey;
    }

    public static String getApiKey() { return apiKey; }
}
