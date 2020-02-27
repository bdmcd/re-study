package DAO;

import DAO.Exception.DaoException;
import Model.Card;
import Request.CreateCardRequest;
import Request.GetCardsRequest;
import Request.UpdateCardRequest;

public interface CardDaoInterface {
    Card CreateCard(CreateCardRequest request) throws DaoException;
    Card UpdateCard(UpdateCardRequest request) throws DaoException;
    Card[] GetCards(GetCardsRequest request) throws DaoException;
}
