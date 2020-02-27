package Service;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.Exception.DaoException;
import Model.Card;
import Request.CreateCardRequest;
import Result.Codes;
import Result.CreateCardResult;

public class CreateCardService {
    public static CreateCardResult processRequest(CreateCardRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        CardDaoInterface cDoa = daoFactory.createCardDao();

        try {
            Card card = cDoa.CreateCard(request);
            return new CreateCardResult(Codes.OK, card);
        } catch (DaoException ex) {
            //TODO: Log the exception here
            return new CreateCardResult(Codes.INTERNAL, "Internal Server Error");
        }
    }
}
