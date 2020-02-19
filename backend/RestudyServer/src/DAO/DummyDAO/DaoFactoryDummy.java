package DAO.DummyDAO;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.SetDaoInterface;
import DAO.UserDAOInterface;

public class DaoFactoryDummy implements DaoFactoryInterface {
    @Override
    public CardDaoInterface createCardDao() {
        return new CardDaoDummy();
    }

    @Override
    public SetDaoInterface createSetDao() {
        return new SetDaoDummy();
    }

    @Override
    public UserDAOInterface createUserDao() {
        return new UserDaoDummy();
    }
}
