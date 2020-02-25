package Service;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.Exception.DaoException;
import Model.Card;
import Request.UpdateCardRequest;
import Result.Codes;
import Result.UpdateCardResult;

public class UpdateCardService {
    public static UpdateCardResult processRequest(UpdateCardRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        CardDaoInterface cDao = daoFactory.createCardDao();

        try {
            Card card = cDao.UpdateCard(request);
            return new UpdateCardResult(Codes.OK, card);
        } catch (DaoException e) {
            e.printStackTrace();
            return new UpdateCardResult(Codes.INTERNAL, "Internal Server Error");
        }
    }
}
