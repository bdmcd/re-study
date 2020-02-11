package Request;

public class UpdateCardRequest {
    private String guid;
    private String question;
    private String answer;
    private String setReference;
    private long nextSession; // todo not needed? should be internal
    private long nextIncrement; // todo not needed? should be internal
    private int retentionScore;
    private boolean deleted;

    public String getGuid() {
        return guid;
    }

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }

    public String getSetReference() {
        return setReference;
    }

    public long getNextSession() {
        return nextSession;
    }

    public long getNextIncrement() {
        return nextIncrement;
    }

    public int getRetentionScore() {
        return retentionScore;
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

    public void setSetReference(String setReference) {
        this.setReference = setReference;
    }

    public void setNextSession(long nextSession) {
        this.nextSession = nextSession;
    }

    public void setNextIncrement(long nextIncrement) {
        this.nextIncrement = nextIncrement;
    }

    public void setRetentionScore(int retentionScore) {
        this.retentionScore = retentionScore;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
