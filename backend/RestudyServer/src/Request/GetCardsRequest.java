package Request;

public class GetCardsRequest {
    private String setGuid;
    private String token;

    public String getSetGuid() {
        return setGuid;
    }

    public String getToken() { return token; }

    public void setSetGuid(String setGuid) {
        this.setGuid = setGuid;
    }

    public void setToken(String token) { this.token = token; }
}
