package Request;

public class CreateSetRequest {
    private String name;
    private String creatorGuid;
    private String token;

    public String getName() {
        return name;
    }

    public String getCreatorGuid() {
        return creatorGuid;
    }

    public String getToken() { return token; }

    public void setName(String name) {
        this.name = name;
    }

    public void setCreatorGuid(String creatorGuid) {
        this.creatorGuid = creatorGuid;
    }

    public void setToken(String token) { this.token = token; }
}
