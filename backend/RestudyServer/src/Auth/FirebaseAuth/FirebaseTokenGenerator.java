package Auth.FirebaseAuth;

import Auth.AuthException;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import java.io.*;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class FirebaseTokenGenerator {
    public String generateToken() {
        try {
            FirebaseAppInitializer.initialize();

            String customToken = FirebaseAuth.getInstance().createCustomToken("test_uid");

            return getIdToken(customToken);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    private String getIdToken(String customToken) {
        try {
            String responseStr = getIdTokenResponse(customToken);
            Map<String, String> responseMap = getResponseMap(responseStr);

            String idToken = responseMap.get("idToken");

            return idToken;
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String getIdTokenResponse(String customToken) throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost("https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=" + FirebaseAppInitializer.getApiKey());

        List<NameValuePair> params = new ArrayList<NameValuePair>(2);
        params.add(new BasicNameValuePair("token", customToken));
        params.add(new BasicNameValuePair("returnSecureToken", "true"));
        post.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));

        HttpResponse response = client.execute(post);
        HttpEntity entity = response.getEntity();

        InputStream stream = entity.getContent();
        Scanner scanner = new Scanner(stream, StandardCharsets.UTF_8.name());
        String text = scanner.useDelimiter("\\A").next();
        scanner.close();

        return text;
    }

    private Map<String, String> getResponseMap(String responseStr) {
        Type mapType = new TypeToken<Map<String, String>>(){}.getType();
        Map<String, String> responseMap = new Gson().fromJson(responseStr, mapType);

        return responseMap;
    }
}
