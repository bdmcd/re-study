package Result;

import Model.Card;
import Model.Set;

public class UpdateSetResult {
    private int statusCode;
    private String error;
    private Set body;

    public UpdateSetResult() {}
    public UpdateSetResult(int statusCode, Set body) {
        this.statusCode = statusCode;
        this.body = body;
    }
    public UpdateSetResult(int statusCode, String error) {
        this.statusCode = statusCode;
        this.error = error;
    }


    public int getStatusCode() {
        return statusCode;
    }

    public String getError() {
        return error;
    }

    public Set getBody() {
        return body;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setBody(Set body) {
        this.body = body;
    }
}
