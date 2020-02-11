package Service;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import Request.GetCardsRequest;
import Result.GetCardsResult;

public class GetCardsService {
    public static GetCardsResult processRequest(GetCardsRequest request){
        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        CardDaoInterface cDao = daoFactory.createCardDao();
        return cDao.GetCards(request);
    }
}
