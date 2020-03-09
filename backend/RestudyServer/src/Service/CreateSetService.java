package Service;

import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import DAO.Exception.DaoException;
import DAO.SetDaoInterface;
import Model.Set;
import Request.CreateSetRequest;
import Result.Codes;
import Result.CreateSetResult;

public class CreateSetService {
    public static CreateSetResult processRequest(CreateSetRequest request) {
        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
//        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        SetDaoInterface sDao = daoFactory.createSetDao();

        try {
            Set set  = sDao.CreateSet(request);
            return new CreateSetResult(Codes.OK, set);
        } catch (DaoException e) {
            //TODO: Log the exception here
            return new CreateSetResult(Codes.INTERNAL, "Internal Server Error");
        }
    }
}
