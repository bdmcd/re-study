package DAO.DynamoDB;

import DAO.CardDaoInterface;
import Model.Card;
import Request.CreateCardRequest;
import Request.GetCardsRequest;
import Request.UpdateCardRequest;
import Result.CreateCardResult;
import Result.GetCardsResult;
import Result.UpdateCardResult;

public class CardDaoDynamoDB implements CardDaoInterface {
    @Override
    public Card CreateCard(CreateCardRequest request) {
        return null;
    }

    @Override
    public Card UpdateCard(UpdateCardRequest request) {
        return null;
    }

    @Override
    public Card[] GetCards(GetCardsRequest request) {
        return null;
    }
}
