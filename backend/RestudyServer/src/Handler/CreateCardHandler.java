package Handler;

import Request.CreateCardRequest;
import Result.CreateCardResult;
import Service.CreateCardService;

public class CreateCardHandler {
    public CreateCardResult HandleRequest(CreateCardRequest request) {
        return CreateCardService.processRequest(request);
    }
}
