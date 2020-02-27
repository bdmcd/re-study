package DAO.DummyDAO;

import DAO.UserDAOInterface;
import Model.User;
import Request.RegisterUserRequest;
import Result.Codes;
import Result.RegisterUserResult;

public class UserDaoDummy implements UserDAOInterface {
    @Override
    public User RegisterUser(RegisterUserRequest request) {
        User user = new User();

        user.setGuid(request.getGuid());
        user.setName(request.getName());

        return user;
    }
}
