package MyGAEApp.project;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import java.io.IOException;
import java.util.Date;

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
		    Key supprkey = KeyFactory.createKey("Suppr", title);
		    String description = req.getParameter("description");
		    Date date = new Date();
		    Entity suppr = new Entity("Suppr", supprkey);
		    suppr.setProperty("user", user);
		    suppr.setProperty("title", title);
		    suppr.setProperty("description", description);
		    suppr.setProperty("date", date);

		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    datastore.put(suppr);
		  }//Shmell paa med formactions som i guestbook jsp
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		resp.setContentType("text/plain");
	    resp.getWriter().println("Hello");
		}

}
