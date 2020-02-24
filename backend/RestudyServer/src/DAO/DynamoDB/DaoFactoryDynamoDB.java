package DAO.DynamoDB;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.SetDaoInterface;
import DAO.UserDAOInterface;

public class DaoFactoryDynamoDB implements DaoFactoryInterface {
    @Override
    public CardDaoInterface createCardDao() {
        return new CardDaoDynamoDB();
    }

    @Override
    public SetDaoInterface createSetDao() {
        return new SetDaoDynamoDB();
    }

    @Override
    public UserDAOInterface createUserDao() {
        return new UserDaoDynamoDB();
    }
}
