package DAO;

import Request.RegisterUserRequest;
import Result.RegisterUserResult;

public interface UserDAOInterface {
    RegisterUserResult RegisterUser(RegisterUserRequest Request);
}
