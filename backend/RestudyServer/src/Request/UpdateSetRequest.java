package Request;

public class UpdateSetRequest {
    private String guid;
    private String name;
    private String token;

    public String getGuid() {
        return guid;
    }

    public String getName() {
        return name;
    }

    public String getToken() { return token; }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setToken() { this.token = token; }
}
