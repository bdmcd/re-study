package Model;

public class Card {
    private String guid;
    private String question;
    private String answer;
    private String setGuid;
    private boolean deleted;

    public String getGuid() { return guid; }

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }

    public String getSetGuid() {
        return setGuid;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setGuid(String guid) { this.guid = guid; }

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
}
