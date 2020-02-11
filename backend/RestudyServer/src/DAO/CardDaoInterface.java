package DAO;

import Request.CreateCardRequest;
import Request.GetCardsRequest;
import Request.UpdateCardRequest;
import Result.CreateCardResult;
import Result.GetCardsResult;
import Result.UpdateCardResult;

public interface CardDaoInterface {
    CreateCardResult CreateCard(CreateCardRequest request);
    UpdateCardResult UpdateCard(UpdateCardRequest request);
    GetCardsResult GetCards(GetCardsRequest request);
}
