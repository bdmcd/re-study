package DAO.Exception;

public class DaoException extends Exception {
    private String message;

    public DaoException() { this.message = ""; }
    public DaoException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
