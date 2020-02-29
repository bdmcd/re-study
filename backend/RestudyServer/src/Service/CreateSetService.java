package Service;

import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import DAO.SetDaoInterface;
import Request.CreateSetRequest;
import Result.CreateSetResult;

public class CreateSetService {
    public static CreateSetResult processRequest(CreateSetRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        SetDaoInterface sDao = daoFactory.createSetDao();
        return sDao.CreateSet(request);
    }
}
