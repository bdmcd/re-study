package Request;

public class CreateCardRequest {
    private String question;
    private String answer;
    private String setGuid;
    private String creatorGuid;
    private int retentionScore;
    private boolean deleted;

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }

    public String getSetGuid() {
        return setGuid;
    }

    public String getCreatorGuid() {
        return creatorGuid;
    }

    public int getRetentionScore() {
        return retentionScore;
    }

    public boolean isDeleted() {
        return deleted;
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

    public void setCreatorGuid(String creatorGuid) {
        this.creatorGuid = creatorGuid;
    }

    public void setRetentionScore(int retentionScore) {
        this.retentionScore = retentionScore;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
