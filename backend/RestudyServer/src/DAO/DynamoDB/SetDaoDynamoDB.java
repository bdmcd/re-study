package DAO.DynamoDB;

import DAO.SetDaoInterface;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;
import Result.CreateSetResult;
import Result.GetSetsResult;
import Result.UpdateSetResult;

public class SetDaoDynamoDB  implements SetDaoInterface {
    @Override
    public CreateSetResult CreateSet(CreateSetRequest request) {
        return null;
    }

    @Override
    public UpdateSetResult UpdateSet(UpdateSetRequest request) {
        return null;
    }

    @Override
    public GetSetsResult GetSets(GetSetsRequest request) {
        return null;
    }
}
