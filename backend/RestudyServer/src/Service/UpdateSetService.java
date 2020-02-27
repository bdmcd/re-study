package Service;

import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.Exception.DaoException;
import DAO.SetDaoInterface;
import Model.Set;
import Request.UpdateSetRequest;
import Result.Codes;
import Result.UpdateSetResult;

public class UpdateSetService {
    public static UpdateSetResult processRequest(UpdateSetRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        SetDaoInterface sDao = daoFactory.createSetDao();

        try {
            Set set = sDao.UpdateSet(request);
            return new UpdateSetResult(Codes.OK, set);
        } catch (DaoException e) {
            e.printStackTrace();
            return new UpdateSetResult(Codes.INTERNAL, "Internal Server Error");
        }
    }
}
