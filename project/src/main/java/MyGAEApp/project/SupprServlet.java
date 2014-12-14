package MyGAEApp.project;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


public class SupprServlet extends HttpServlet{
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res)
        throws IOException {
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    	String blobkey;
    	String supprName = req.getParameter("supprkey");
    	Filter propertyFilter =new FilterPredicate("supprkey", FilterOperator.EQUAL, supprName);
        
    	Query q = new Query("Suppr").setFilter(propertyFilter);
        List<Entity> supprs = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(30));
        for (Entity suppr : supprs) {
            blobkey=suppr.getProperty("image").toString();
            
    	
    	BlobKey blobKey = new BlobKey(blobkey);
        blobstoreService.serve(blobKey, res);
        }
    }
}
