package com.henriette.FirstGAEApp;

	// The Enqueue servlet should be mapped to the "/enqueue" URL.
	import java.io.IOException;
	import java.io.PrintWriter;
	import java.util.Date;
	 
	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	 
	import com.google.appengine.api.datastore.DatastoreService;
	import com.google.appengine.api.datastore.DatastoreServiceFactory;
	import com.google.appengine.api.datastore.Entity;
	import com.google.appengine.api.datastore.PreparedQuery;
	import com.google.appengine.api.datastore.Query;
	import com.google.appengine.api.datastore.Key;
	 
	public class ReadData extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//Set response format to html
			response.setContentType("text/html");
	        PrintWriter htmlresp = response.getWriter();
	       
	        DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	       
	        Query q = new Query("TaskData");
	        PreparedQuery pq = ds.prepare(q);
	       
	        htmlresp.print("<p>List of entities and their properties</p>");
	        for (Entity result : pq.asIterable()) {
	                Key key = result.getKey();
	                String value = (String) result.getProperty("value");
	                Date date = (Date) result.getProperty("date");
	                htmlresp.print("<p>" + key + " " + value + " " + date + "</p><br><br>");
	        }
	    }	
}
