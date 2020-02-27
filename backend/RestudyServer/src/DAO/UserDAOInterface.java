package DAO;

import DAO.Exception.DaoException;
import Model.User;
import Request.RegisterUserRequest;

public interface UserDAOInterface {
    User RegisterUser(RegisterUserRequest Request) throws DaoException;
}
