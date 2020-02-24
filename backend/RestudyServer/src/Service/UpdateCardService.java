package Service;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import Request.UpdateCardRequest;
import Result.UpdateCardResult;

public class UpdateCardService {
    public static UpdateCardResult processRequest(UpdateCardRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        CardDaoInterface cDao = daoFactory.createCardDao();
        return cDao.UpdateCard(request);
    }
}
