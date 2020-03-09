package Service;

import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import DAO.Exception.DaoException;
import DAO.SetDaoInterface;
import Model.Set;
import Request.GetSetsRequest;
import Result.Codes;
import Result.GetSetsResult;

public class GetSetsService {
    public static GetSetsResult processRequest(GetSetsRequest request) {
        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
//        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        SetDaoInterface sDao = daoFactory.createSetDao();

        try {
            Set[] sets = sDao.GetSets(request);
            return new GetSetsResult(Codes.OK, sets);
        } catch (DaoException e) {
            //TODO: Log the exception here
            return new GetSetsResult(Codes.INTERNAL, "Internal Server Error");
        }
    }
}
