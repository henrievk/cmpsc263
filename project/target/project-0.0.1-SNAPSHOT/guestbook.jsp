<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
Suppr

</head>
Enjoy a meal with new people; Share the fun as well as the costs!
<body>
<p>What is Suppr?  <a href="/about.jsp">Click for info</a> 
<p>Log in to view shared meals in your area or host one yourself!
<% UserService userService = UserServiceFactory.getUserService(); %>    
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Log in</a>
</p>


</body>
</html>
