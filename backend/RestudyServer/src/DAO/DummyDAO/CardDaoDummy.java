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
    public CreateCardResult CreateCard(CreateCardRequest request) {
        Card card = new Card();

        card.setCreatorGuid(request.getCreatorGuid());
        card.setQuestion(request.getQuestion());
        card.setAnswer(request.getAnswer());
        card.setDeleted(false);
        card.setSetGuid(request.getSetGuid());

        return new CreateCardResult(Codes.OK, null, card);
    }

    @Override
    public UpdateCardResult UpdateCard(UpdateCardRequest request) {
        UpdateCardResult result = new UpdateCardResult();
        return result;
    }

    @Override
    public GetCardsResult GetCards(GetCardsRequest request) {
        GetCardsResult result = new GetCardsResult();
        return result;
    }
}
