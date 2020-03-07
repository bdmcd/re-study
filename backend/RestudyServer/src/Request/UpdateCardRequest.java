package Request;

public class UpdateCardRequest {
    private String guid;
    private String setGuid;
    private String newSetGuid;
    private String question;
    private String answer;
    private boolean deleted;
    private String token;

    public String getGuid() {
        return guid;
    }

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }

    public String getSetGuid() {
        return setGuid;
    }

    public String getToken() { return token; }

    public String getNewSetGuid() {
        return newSetGuid;
    }
    public boolean isDeleted() {
        return deleted;
    }


    public void setGuid(String guid) {
        this.guid = guid;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setSetGuid(String setGuid) {
        this.setGuid = setGuid;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public  void setToken(String token) { this.token = token; }
  
    public void setNewSetGuid(String newSetGuid) {
        this.newSetGuid = newSetGuid;
    }
}
