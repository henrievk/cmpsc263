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

<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<html>

<head>
	<title>Suppr</title>
</head>

<body>

	<%
		UserService userService = UserServiceFactory.getUserService();
	User currentUser = userService.getCurrentUser();
	if (currentUser != null) {
	%>
		<p>Host a Suppr!  <a href="/hostSuppr">Click to create</a> 
		<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log out</a>

	<%
		} 
		else {
	%>
		Enjoy a meal with new people; Share the fun as well as the costs!
		<p>What is Suppr?  <a href="/about.jsp">Click for info</a> 
		<p>Log in to view shared meals in your area or host one yourself!    
		<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Log in</a>
	<%
		}
	%>

</body>
</html>