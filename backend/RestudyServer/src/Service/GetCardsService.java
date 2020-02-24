package Service;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import Request.GetCardsRequest;
import Result.GetCardsResult;

public class GetCardsService {
    public static GetCardsResult processRequest(GetCardsRequest request){
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        CardDaoInterface cDao = daoFactory.createCardDao();
        return cDao.GetCards(request);
    }
}
