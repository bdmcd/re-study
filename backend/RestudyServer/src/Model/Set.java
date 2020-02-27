package Model;

public class Set {
    private String guid;
    private String name;
    private String creatorGuid;


    public Set(){}
    public Set(String guid, String creatorGuid, String name) {
        setGuid(guid);
        setName(name);
        setCreatorGuid(creatorGuid);
    }

    public String getGuid() {
        return guid;
    }

    public String getName() {
        return name;
    }

    public String getCreatorGuid() {
        return creatorGuid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCreatorGuid(String creatorGuid) {
        this.creatorGuid = creatorGuid;
    }

}
