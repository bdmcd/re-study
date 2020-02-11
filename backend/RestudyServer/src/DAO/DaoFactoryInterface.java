package DAO;

public interface DaoFactoryInterface {
    CardDaoInterface createCardDao();
    SetDaoInterface createSetDao();
    UserDAOInterface createUserDao();
