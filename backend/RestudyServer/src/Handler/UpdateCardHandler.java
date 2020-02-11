package Handler;

import Request.UpdateCardRequest;
import Result.UpdateCardResult;
import Service.UpdateCardService;

public class UpdateCardHandler {
    public UpdateCardResult HandleRequest(UpdateCardRequest request) {
        return UpdateCardService.processRequest(request);
    }
}
