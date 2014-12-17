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
<%
UserService userService = UserServiceFactory.getUserService();
%>
<body>
<div class="container">   
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  	<div class="navbar-header">
  	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
  	</div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  	<div class="collapse navbar-collapse navbar-ex1-collapse">
    	<div class="navbar-header">
    	</div>
    	<div>
    		<ul class="nav navbar-nav navbar-left">
        	<li><a href="/home"><h4><b>Suppr</b></h4></a></li>
    		</ul>
    		<ul class="nav navbar-nav navbar-right">
    		<li><a href="/mySupprs.jsp">My Supprs</a></li>
    		<li><a href="recipies.jsp">Recipies</a></li>
        	<li><a href="/ListingsSupprs.jsp">Suppr listings</a></li>
        	<li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Logout</a></li> 
    		</ul>
  		</div>
  	</div><!-- /.navbar-collapse -->
</nav>
	<%
	User currentUser = userService.getCurrentUser();
	if (currentUser != null) {
	%>
		<div class="jumbotron">
		<h1><b>What do you want to do today?</b></h1>
		
		<p><a <button type="button" class="btn btn-lg btn-danger" href="/upload.jsp">Host a Suppr </a></button>
		<a <button type="button" class="btn btn-lg btn-danger" href="/ListingsSupprs.jsp">Join a Suppr</a></button><br>
		</div>
		<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log out</a>
 	</div>
	<%
		} 
		else {
	%>
    <div class="jumbotron">
        <h1>Welcome to Suppr!</h1>
        <p class="lead">Enjoy a meal with new people;<br>
        Share the fun as well as the costs!</p>
        <p><a class="btn btn-lg btn-danger" href="<%= userService.createLoginURL(request.getRequestURI())%>" role="button">Sign up today</a></p>
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