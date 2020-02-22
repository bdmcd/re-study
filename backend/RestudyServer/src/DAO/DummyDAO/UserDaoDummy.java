package DAO.DummyDAO;

import DAO.UserDAOInterface;
import Model.User;
import Request.RegisterUserRequest;
import Result.Codes;
import Result.RegisterUserResult;

public class UserDaoDummy implements UserDAOInterface {
    @Override
    public RegisterUserResult RegisterUser(RegisterUserRequest request) {
        User user = new User();

        user.setGuid(request.getGuid());
        user.setName(request.getName());

        return new RegisterUserResult(Codes.OK, null, user);
    }
}
