package Request;

public class RegisterUserRequest {
    private String name;
    private String guid;
    private String token;

    public String getName() {
        return name;
    }

    public String getGuid() {
        return guid;
    }

    public String getToken() { return token; }

    public void setName(String name) {
        this.name = name;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public void setToken(String token) { this.token = token; }
}
