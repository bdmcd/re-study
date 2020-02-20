package Handler;

import Request.GetSetsRequest;
import Result.GetSetsResult;
import Service.GetSetsService;

public class GetSetsHandler {
    public GetSetsResult HandleRequest(GetSetsRequest request) {
        return GetSetsService.processRequest(request);
    }
}
