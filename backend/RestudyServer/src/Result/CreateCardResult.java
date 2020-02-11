package Result;

import Model.Card;

public class CreateCardResult {
    private int statusCode;
    private String error;
    private Card body;

    public int getStatusCode() {
        return statusCode;
    }

    public String getError() {
        return error;
    }

    public Card getBody() {
        return body;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setBody(Card body) {
        this.body = body;
    }
}
