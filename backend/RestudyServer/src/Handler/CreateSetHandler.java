package Handler;

import Request.CreateSetRequest;
import Result.CreateSetResult;
import Service.CreateSetService;

public class CreateSetHandler {
    public CreateSetResult HandleRequest(CreateSetRequest request) {
        return CreateSetService.processRequest(request);
    }
}
