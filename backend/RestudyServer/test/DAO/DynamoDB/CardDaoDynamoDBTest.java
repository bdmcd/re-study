//package DAO.DynamoDB;
//
//import DAO.CardDaoInterface;
//import DAO.Exception.DaoException;
//import Model.Card;
//import Model.Set;
//import Request.CreateCardRequest;
//import Request.GetCardsRequest;
//import Request.UpdateCardRequest;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//class CardDaoDynamoDBTest {
//
//    @Test
//    void createCard() {
//        CardDaoInterface cDao = new CardDaoDynamoDB();
//        CreateCardRequest request = new CreateCardRequest();
//
//        for(int i = 0; i < 10; i++) {
//            request.setAnswer("myanswer " + i);
//            request.setQuestion("myquestion " + i);
//            request.setSetGuid("mysetguid");
//            request.setCreatorGuid("firebaseguid");
//            Card card = null;
//            try {
//                card = cDao.CreateCard(request);
//            } catch (DaoException e){
//                e.printStackTrace();
//            }
//            assertNotNull(card);
//        }
//    }
//
//    @Test
//    void updateCard() {
//        CardDaoInterface cDao = new CardDaoDynamoDB();
//        CreateCardRequest request = new CreateCardRequest();
//
//        request.setAnswer("myanswer");
//        request.setQuestion("myquestion ");
//        request.setSetGuid("mysetguid");
//        request.setCreatorGuid("firebaseguid");
//        Card card = new Card();
//        try {
//            card = cDao.CreateCard(request);
//        } catch (DaoException e){
//            e.printStackTrace();
//        }
//
//        assertEquals("myanswer", card.getAnswer());
//
//        UpdateCardRequest updaterequest = new UpdateCardRequest();
//        updaterequest.setGuid(card.getGuid());
//        updaterequest.setSetGuid(card.getSetGuid());
//        updaterequest.setNewSetGuid("newSetGuid");
//
////        request.setNewSetGuid("updateSetGuid"); cannot update the part of the key unless you wnat to delete the card and recreate it.
//        updaterequest.setAnswer("wrong updated new 1");
//        updaterequest.setQuestion("newQuestion update 1");
//        updaterequest.setDeleted(true);
//
//        try {
//            card = cDao.UpdateCard(updaterequest);
//        } catch (DaoException e){
//            e.printStackTrace();
//        }
//        assertEquals("wrong updated new 1", card.getAnswer());
//    }
//
//    @Test
//    void getCards() {
//        CardDaoInterface cDao = new CardDaoDynamoDB();
//        GetCardsRequest request = new GetCardsRequest();
//
//
//        CreateCardRequest createrequest = new CreateCardRequest();
//
//        for(int i = 0; i < 10; i++) {
//            createrequest.setAnswer("myanswer " + i);
//            createrequest.setQuestion("myquestion " + i);
//            createrequest.setSetGuid("mysetguid");
//            createrequest.setCreatorGuid("firebaseguid");
//            Card card = null;
//            try {
//                card = cDao.CreateCard(createrequest);
//            } catch (DaoException e){
//                e.printStackTrace();
//            }
//            assertNotNull(card);
//        }
//
//        request.setSetGuid("mysetguid");
//
//        Card[] cards = null;
//
//        try {
//            cards = cDao.GetCards(request);
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//        assertNotNull(cards);
//        assertNotNull(cards[0]);
//        assertNotNull(cards[5]);
//        assertNotNull(cards[9]);
//
//    }
//}
