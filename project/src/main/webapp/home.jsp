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
	<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css"/>
	<title>Suppr</title>
</head>

<body>

	<%
		UserService userService = UserServiceFactory.getUserService();
	User currentUser = userService.getCurrentUser();
	if (currentUser != null) {
	%>
	<div class="container">
		<div class="jumbotron">
		<h1><b>What do you want to do today?</b></h1>
		
		<p><a <button type="button" class="btn btn-lg btn-danger" href="/hostSuppr">Host a Suppr </a></button>
		<a <button type="button" class="btn btn-lg btn-danger" href="/ListingsSupprs.jsp">Join a Suppr</a></button><br>
		</div>
		<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log out</a>
 	</div>
	<%
		} 
		else {
	%>
		<div class="container">
    <div class="jumbotron">
        <h1>Welcome to Suppr!</h1>
        <p class="lead">Enjoy a meal with new people;<br>
        Share the fun as well as the costs!</p>
        <p><a class="btn btn-lg btn-success" href="<%= userService.createLoginURL(request.getRequestURI())%>" role="button">Sign up today</a></p>
      </div>

      <div class="row marketing">
        <div class="col-lg-6">
          <h4><a href="/about.jsp">About Suppr</a></h4>
          <p>Find out more about Suppr and how it works.</p>
        </div>

        <div class="col-lg-6">
          <h4><a href="/contact.jsp">Contact</a></h4>
          <p>Feel free to get in touch with us if you should have any questions or feedback.</p>
        </div>
      </div>
      </div>
	<%
		}
	%>

</body>
</html>