package DAO.DummyDAO;

import DAO.SetDaoInterface;
import Model.Set;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;
import Result.Codes;
import Result.CreateSetResult;
import Result.GetSetsResult;
import Result.UpdateSetResult;

public class SetDaoDummy implements SetDaoInterface {
    @Override
    public CreateSetResult CreateSet(CreateSetRequest request) {
        Set set  = new Set();

        set.setGuid("set_guid");
        set.setName(request.getName());
        set.setCreatorGuid(request.getCreatorGuid());

        return new CreateSetResult(Codes.OK, null, set);
    }

    @Override
    public UpdateSetResult UpdateSet(UpdateSetRequest request) {
        UpdateSetResult result = new UpdateSetResult();
        return result;
    }

    @Override
    public GetSetsResult GetSets(GetSetsRequest request) {
        Set[] sets = {
                new Set("set1", request.getUserGuid(), "Set 1"),
                new Set("set2", request.getUserGuid(), "Set 2"),
                new Set("set3", request.getUserGuid(), "Set 3"),
                new Set("set4", request.getUserGuid(), "Set 4"),
                new Set("set5", request.getUserGuid(), "Set 5"),

        };

        return new GetSetsResult(Codes.OK, null, sets);
    }
}
