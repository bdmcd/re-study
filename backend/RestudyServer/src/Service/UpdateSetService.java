package Service;

import DAO.DaoFactoryInterface;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import DAO.SetDaoInterface;
import Request.UpdateSetRequest;
import Result.UpdateSetResult;

public class UpdateSetService {
    public static UpdateSetResult processRequest(UpdateSetRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        SetDaoInterface sDao = daoFactory.createSetDao();
        return sDao.UpdateSet(request);
    }
}
