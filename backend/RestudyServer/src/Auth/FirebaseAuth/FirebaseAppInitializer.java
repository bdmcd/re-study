package Auth.FirebaseAuth;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

public class FirebaseAppInitializer {
    private static boolean isInitialized;
    private static String apiKey;

    public static void initialize() throws IOException {
        if (!isInitialized) {
            apiKey = readApiKey();

            FileInputStream serviceAccount =
                    new FileInputStream("src/firebase/restudy-fe85d-firebase-adminsdk-6v08x-498efd7c8e.json");

            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setDatabaseUrl("https://restudy-fe85d.firebaseio.com")
                    .build();

            FirebaseApp.initializeApp(options);

            isInitialized = true;
        }
    }

    private static String readApiKey() throws FileNotFoundException {
        File apiKeyFile = new File("src/firebase/api-key.txt");
        Scanner apiKeyScanner = new Scanner(apiKeyFile);
        String apiKey = apiKeyScanner.useDelimiter("\\A").next();
        apiKeyScanner.close();

        return apiKey;
    }

    public static String getApiKey() { return apiKey; }
}
