package Service;

import DAO.DaoFactoryInterface;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import DAO.SetDaoInterface;
import Request.GetSetsRequest;
import Result.GetSetsResult;

public class GetSetsService {
    public static GetSetsResult processRequest(GetSetsRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        SetDaoInterface sDao = daoFactory.createSetDao();
        return sDao.GetSets(request);
    }
}
