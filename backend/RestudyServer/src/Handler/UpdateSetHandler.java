package Handler;

import Request.UpdateSetRequest;
import Result.UpdateSetResult;
import Service.UpdateSetService;

public class UpdateSetHandler {
    public UpdateSetResult HandleRequest(UpdateSetRequest request) {
        return UpdateSetService.processRequest(request);
    }
}
