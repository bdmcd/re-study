package DAO;

import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;
import Result.CreateSetResult;
import Result.GetSetsResult;
import Result.UpdateSetResult;

public interface SetDaoInterface {
    CreateSetResult CreateSet(CreateSetRequest request);
    UpdateSetResult UpdateSet(UpdateSetRequest request);
    GetSetsResult GetSets(GetSetsRequest request);
}
