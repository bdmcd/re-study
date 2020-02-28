package Service;

import DAO.DaoFactoryInterface;
import DAO.DummyDAO.DaoFactoryDummy;
import DAO.Exception.DaoException;
import DAO.UserDAOInterface;
import Model.User;
import Request.RegisterUserRequest;
import Result.Codes;
import Result.RegisterUserResult;

public class RegisterUserService {
    public static RegisterUserResult processRequest(RegisterUserRequest request) {
//        DaoFactoryInterface daoFactory = new DaoFactoryDynamoDB();
        DaoFactoryInterface daoFactory = new DaoFactoryDummy();
        UserDAOInterface uDao = daoFactory.createUserDao();

        try {
            User user = uDao.RegisterUser(request);
            return new RegisterUserResult(Codes.OK, user);
        } catch (DaoException e) {
            //TODO: Log the exception here
            return new RegisterUserResult(Codes.INTERNAL, "Internal Server Error");
        }
    }
}
