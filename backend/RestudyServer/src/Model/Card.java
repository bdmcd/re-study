package Model;

public class Card {
    private String guid;
    private String question;
    private String answer;
    private String setGuid;
    private String setName;
//    private String creatorGuid; not actually needed
    private boolean correct;
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

    public String getSetName() {
        return setName;
    }

//    public String getCreatorGuid() {
//        return creatorGuid;
//    }

    public boolean isCorrect() {
        return correct;
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

    public void setSetName(String setName) {
        this.setName = setName;
    }

//    public void setCreatorGuid(String creatorGuid) {
//        this.creatorGuid = creatorGuid;
//    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
