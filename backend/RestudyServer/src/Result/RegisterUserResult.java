package Result;

import Model.User;

public class RegisterUserResult {
    private int statusCode;
    private String error;
    private User body;

    public int getStatusCode() {
        return statusCode;
    }

    public String getError() {
        return error;
    }

    public User getBody() {
        return body;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setBody(User body) {
        this.body = body;
    }
}
