package DAO.DynamoDB;

import DAO.SetDaoInterface;
import Model.Set;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;
import Result.CreateSetResult;
import Result.GetSetsResult;
import Result.UpdateSetResult;

public class SetDaoDynamoDB  implements SetDaoInterface {
    @Override
    public Set CreateSet(CreateSetRequest request) {
        return null;
    }

    @Override
    public Set UpdateSet(UpdateSetRequest request) {
        return null;
    }

    @Override
    public Set[] GetSets(GetSetsRequest request) {
        return null;
    }
}
