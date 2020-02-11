package Service;

import DAO.CardDaoInterface;
import DAO.DaoFactoryInterface;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import Request.CreateCardRequest;
import Result.CreateCardResult;

public class CreateCardService {
    public static CreateCardResult processRequest(CreateCardRequest request) {
        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        CardDaoInterface cDoa = daoFactory.createCardDao();
        return cDoa.CreateCard(request);
    }
}
