package MyGAEApp.project;

import static com.google.appengine.api.taskqueue.TaskOptions.Builder.withUrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;

public class Enqueue extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
	         throws ServletException, IOException {
		String title = req.getParameter("title");
	    String description = req.getParameter("description");
	    String blobkey=req.getParameter("blobkey");
	    String user = req.getParameter("user");
	    
	    Queue queue = QueueFactory.getDefaultQueue();
	    queue.add(withUrl("/hostSuppr").param("title", title).param("description", description).param("blobkey", blobkey).param("user", user));

	    res.sendRedirect("/created.jsp");
	 }
}
