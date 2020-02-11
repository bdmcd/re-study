package DAO.DynamoDB;

import DAO.CardDaoInterface;
import Request.CreateCardRequest;
import Request.GetCardsRequest;
import Request.UpdateCardRequest;
import Result.CreateCardResult;
import Result.GetCardsResult;
import Result.UpdateCardResult;

public class CardDaoDynamoDB implements CardDaoInterface {
    @Override
    public CreateCardResult CreateCard(CreateCardRequest request) {
        return null;
    }

    @Override
    public UpdateCardResult UpdateCard(UpdateCardRequest request) {
        return null;
    }

    @Override
    public GetCardsResult GetCards(GetCardsRequest request) {
        return null;
    }
}
