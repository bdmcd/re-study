package Service;

import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.DynamoDB.DaoFactoryDynamoDB;
import DAO.UserDAOInterface;
import Request.RegisterUserRequest;
import Result.RegisterUserResult;

public class RegisterUserService {
    public static RegisterUserResult processRequest(RegisterUserRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        UserDAOInterface uDao = daoFactory.createUserDao();
        return uDao.RegisterUser(request);
    }
}
