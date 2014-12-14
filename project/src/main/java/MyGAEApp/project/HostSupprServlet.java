package MyGAEApp.project;
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

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HostSupprServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
		      throws IOException, ServletException {
		    UserService userService = UserServiceFactory.getUserService();
		    
		    User user = userService.getCurrentUser();
		    String title = req.getParameter("title");
		    String description = req.getParameter("description");
		    String blobkey=req.getParameter("blobkey");
		    System.out.println("BLOOOOOB!!!!!!!!" + blobkey +"END OF BLOOOB");
		    
		    Date createdAt = new Date();
		    
		    Key supprkey = KeyFactory.createKey("Suppr", title);
		    
		    Entity suppr = new Entity("Suppr", supprkey);
		    suppr.setProperty("supprkey", KeyFactory.keyToString(supprkey));
		    suppr.setProperty("user", user);
		    suppr.setProperty("title", title);
		    suppr.setProperty("description", description);
		    suppr.setProperty("createdAt", createdAt);
		    suppr.setProperty("image", blobkey);

		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    datastore.put(suppr);
		    String SupprKeyStr = KeyFactory.keyToString(supprkey);
		    resp.sendRedirect("/suppr.jsp?supprkey=" + SupprKeyStr);
		  }
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		resp.setContentType("text/plain");
		req.getRequestDispatcher("hostSuppr.jsp").forward(req, resp);
		}

	
}

