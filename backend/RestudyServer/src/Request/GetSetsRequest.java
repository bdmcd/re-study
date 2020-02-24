package Request;

public class GetSetsRequest {
    private String userGuid;
    private String token;

    public String getUserGuid() {
        return userGuid;
    }

    public String getToken() { return token; }

    public void setUserGuid(String userGuid) {
        this.userGuid = userGuid;
    }

    public void setToken() { this.token = token; }
}
