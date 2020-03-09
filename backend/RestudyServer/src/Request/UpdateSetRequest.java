package Request;

public class UpdateSetRequest {
    private String guid;
    private String creatorGuid;
    private String name;
    private Boolean deleted;
    private String token;

    public String getGuid() {
        return guid;
    }

    public String getName() {
        return name;
    }

    public String getToken() { return token; }

    public String getCreatorGuid() {
        return creatorGuid;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setToken(String token) {
      this.token = token; 
    }

    public void setCreatorGuid(String creatorGuid) {
        this.creatorGuid = creatorGuid;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }
}
