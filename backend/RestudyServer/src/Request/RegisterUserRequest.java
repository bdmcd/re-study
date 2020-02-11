package Request;

public class RegisterUserRequest {
    private String name;
    private String guid;

    public String getName() {
        return name;
    }

    public String getGuid() {
        return guid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }
}
