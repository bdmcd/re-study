package DAO.DummyDAO;

import DAO.CardDaoInterface;
import Model.Card;
import Request.CreateCardRequest;
import Request.GetCardsRequest;
import Request.UpdateCardRequest;

public class CardDaoDummy implements CardDaoInterface {
    @Override
    public Card CreateCard(CreateCardRequest request) {
        Card card = new Card();


        card.setGuid("card_guid");
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
        int count = 5;
        Card[] cards = new Card[count];

        for (int i = 0; i < count; i++) {
            Card card = new Card();

            card.setSetGuid(request.getSetGuid());
            card.setGuid("card_guid" + i);
//            card.setSetName("My Set");
            card.setDeleted(false);
            card.setQuestion("Question " + i);
            card.setAnswer("Answer " + i);

            cards[i] = card;
        }

        return cards;
    }
}
