package Service;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.Exception.DaoException;
import Model.Card;
import Request.GetCardsRequest;
import Result.Codes;
import Result.GetCardsResult;

public class GetCardsService {
    public static GetCardsResult processRequest(GetCardsRequest request){
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        CardDaoInterface cDao = daoFactory.createCardDao();

        try {
            Card[] cards = cDao.GetCards(request);
            return new GetCardsResult(Codes.OK, cards);
        } catch (DaoException e) {
            e.printStackTrace();
            return new GetCardsResult(Codes.INTERNAL, "Internal Server Error");
        }
    }
}
