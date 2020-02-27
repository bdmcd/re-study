package DAO.DummyDAO;

import DAO.CardDaoInterface;
import Model.Card;
import Request.CreateCardRequest;
import Request.GetCardsRequest;
import Request.UpdateCardRequest;
import Result.Codes;
import Result.CreateCardResult;
import Result.GetCardsResult;
import Result.UpdateCardResult;

public class CardDaoDummy implements CardDaoInterface {
    @Override
    public Card CreateCard(CreateCardRequest request) {
        Card card = new Card();

//        card.setCreatorGuid(request.getCreatorGuid());
        card.setQuestion(request.getQuestion());
        card.setAnswer(request.getAnswer());
        card.setDeleted(false);
        card.setSetGuid(request.getSetGuid());

        return card;
    }

    @Override
    public Card UpdateCard(UpdateCardRequest request) {
        return new Card();
    }

    @Override
    public Card[] GetCards(GetCardsRequest request) {
        Card[] cards = {};
        return cards;
    }
}
