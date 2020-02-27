package DAO.DummyDAO;

import DAO.SetDaoInterface;
import Model.Set;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;

public class SetDaoDummy implements SetDaoInterface {
    @Override
    public Set CreateSet(CreateSetRequest request) {
        Set set  = new Set();

        set.setGuid("set_guid");
        set.setName(request.getName());
        set.setCreatorGuid(request.getCreatorGuid());

        return set;
    }

    @Override
    public Set UpdateSet(UpdateSetRequest request) {
        return new Set();
    }

    @Override
    public Set[] GetSets(GetSetsRequest request) {
        Set[] sets = {
                new Set("set1", request.getUserGuid(), "Set 1"),
                new Set("set2", request.getUserGuid(), "Set 2"),
                new Set("set3", request.getUserGuid(), "Set 3"),
                new Set("set4", request.getUserGuid(), "Set 4"),
                new Set("set5", request.getUserGuid(), "Set 5"),
        };

        return sets;
    }
}
