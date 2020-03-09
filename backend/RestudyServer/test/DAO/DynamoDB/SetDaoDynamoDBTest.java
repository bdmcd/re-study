package DAO.DynamoDB;

import DAO.Exception.DaoException;
import DAO.SetDaoInterface;
import Model.Set;
import Request.CreateSetRequest;
import Request.GetSetsRequest;
import Request.UpdateSetRequest;
import com.amazonaws.services.dynamodbv2.xspec.S;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class SetDaoDynamoDBTest {

    @Test
    void createSet() {
        SetDaoInterface sDao = new SetDaoDynamoDB();
        CreateSetRequest request = new CreateSetRequest();
        request.setCreatorGuid("firebaseGuid");
        request.setName("setName");
        Set set = null;
        try {
            set = sDao.CreateSet(request);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        assertNotNull(set);
    }

    @Test
    void updateSet() {
        SetDaoInterface sDao = new SetDaoDynamoDB();
        CreateSetRequest request = new CreateSetRequest();
        request.setCreatorGuid("firebaseGuid1");
        request.setName("setNametoreplace");
        Set set = new Set();
        try {
            set = sDao.CreateSet(request);
        } catch (DaoException e) {
            e.printStackTrace();
        }

        assertEquals("setNametoreplace", set.getName());

        UpdateSetRequest updaterequest = new UpdateSetRequest();
        updaterequest.setName("updated Name");
        updaterequest.setGuid(set.getGuid());
        updaterequest.setCreatorGuid(set.getCreatorGuid());
        updaterequest.setDeleted(true);

        try {
            set = sDao.UpdateSet(updaterequest);
        } catch (DaoException e) {
            e.printStackTrace();
        }
         assertEquals("updated Name", set.getName());
    }

    @Test
    void getSets() {
        SetDaoInterface sDao = new SetDaoDynamoDB();

        for(int i = 0; i < 10; i++) {
            CreateSetRequest request = new CreateSetRequest();
            request.setCreatorGuid("firebaseGuid");
            request.setName("setName" + i);
            try {
                sDao.CreateSet(request);
            } catch (DaoException e) {
                e.printStackTrace();
            }
        }

        Set[] sets = null;
        GetSetsRequest getRequest = new GetSetsRequest();
        getRequest.setUserGuid("firebaseGuid");
        try {
            sets = sDao.GetSets(getRequest);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        assertNotNull(sets);
        assertNotNull(sets[9]);

    }
}
