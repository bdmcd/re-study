package Result;

import Model.Card;
import Model.Set;

public class GetSetsResult {
    private int statusCode;
    private String error;
    private Set[] body;

    public GetSetsResult() {}
    public GetSetsResult(int statusCode, String error, Set[] body) {
        this.statusCode = statusCode;
        this.error = error;
        this.body = body;
    }


    public int getStatusCode() {
        return statusCode;
    }

    public String getError() {
        return error;
    }

    public Set[] getBody() {
        return body;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setBody(Set[] body) {
        this.body = body;
    }
}
