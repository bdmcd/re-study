package Handler;

import Request.GetCardsRequest;
import Result.GetCardsResult;
import Service.GetCardsService;

public class GetCardsHandler {
    public GetCardsResult HandleRequest(GetCardsRequest request) {
        return GetCardsService.processRequest(request);
    }
}
