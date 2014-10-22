package com.henriette.FirstGAEApp;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.*;
//The Worker servlet should be mapped to the "/worker" URL.
public class Worker extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	 String key = request.getParameter("key");
     String value =request.getParameter("value");
     Date date = new Date();
     
     Entity entity = new Entity("TaskData",key);
     entity.setProperty("value", value);
     entity.setProperty("date", date);

     DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
     datastore.put(entity);

     response.sendRedirect("/done.html");
     
     //to create an entity of type TaskData and store it in the datastore using the 
     //key value that was passed in. These entities should have properties "value" and 
     //"date" which hold the string value passed in and the current date value, respectively.
 }
}


