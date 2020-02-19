package DAO.DummyDAO;

import DAO.UserDAOInterface;
import Request.RegisterUserRequest;
import Result.RegisterUserResult;

public class UserDaoDummy implements UserDAOInterface {
    @Override
    public RegisterUserResult RegisterUser(RegisterUserRequest Request) {
        return null;
    }
}
