package Model;

public class User {
    private String name;
    private String guid; // must not be null, comes from fire-base

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
