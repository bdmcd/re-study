package Request;

public class CreateSetRequest {
    private String name;
    private String creatorGuid;

    public String getName() {
        return name;
    }

    public String getCreatorGuid() {
        return creatorGuid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCreatorGuid(String creatorGuid) {
        this.creatorGuid = creatorGuid;
    }
}
