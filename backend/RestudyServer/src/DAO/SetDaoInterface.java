package DAO;

import DAO.Exception.DaoException;
import Model.Set;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;

public interface SetDaoInterface {
    Set CreateSet(CreateSetRequest request) throws DaoException;
    Set UpdateSet(UpdateSetRequest request) throws DaoException;
    Set[] GetSets(GetSetsRequest request) throws DaoException;
}
