package DAO.DummyDAO;

import DAO.SetDaoInterface;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;
import Result.CreateSetResult;
import Result.GetSetsResult;
import Result.UpdateSetResult;

public class SetDaoDummy implements SetDaoInterface {
    @Override
    public CreateSetResult CreateSet(CreateSetRequest request) {
        CreateSetResult result = new CreateSetResult();
        return result;
    }

    @Override
    public UpdateSetResult UpdateSet(UpdateSetRequest request) {
        UpdateSetResult result = new UpdateSetResult();
        return result;
    }

    @Override
    public GetSetsResult GetSets(GetSetsRequest request) {
        GetSetsResult result = new GetSetsResult();
        return result;
    }
}
