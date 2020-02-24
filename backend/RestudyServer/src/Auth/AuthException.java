package Auth;

public class AuthException extends Exception {
    private String message;

    public AuthException() { this.message = ""; }
    public AuthException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
