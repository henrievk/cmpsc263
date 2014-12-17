
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
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Query.Filter" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterPredicate" %>
<%@ page import="com.google.appengine.api.datastore.Query.CompositeFilterOperator" %>
<%@ page import="com.google.appengine.api.datastore.Query.CompositeFilter" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Query.SortDirection" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css"/>
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
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
 	User currentUser = userService.getCurrentUser();
 	if (currentUser == null) {
%>
You are not logged in
<%
    }
    else{
    String user = currentUser.toString();
    Filter propertyFilter =new FilterPredicate("user", FilterOperator.EQUAL, user);
    Query q = new Query("Suppr").setFilter(propertyFilter).addSort("createdAt", SortDirection.DESCENDING);
    List<Entity> supprs = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(30));
    String bk;
    for (Entity suppr : supprs) {
        pageContext.setAttribute("name", suppr.getProperty("title"));
        pageContext.setAttribute("location", suppr.getProperty("location"));
        pageContext.setAttribute("info", suppr.getProperty("description"));
        pageContext.setAttribute("blobkey", suppr.getProperty("image"));
        bk = suppr.getProperty("image").toString();
%> 
<div class="jumbotron">
  <div class="row">
    <div class="col-md-6">
      <img src="/serve?blobkey=${fn:escapeXml(blobkey)}" class="img-thumbnail"/>
    </div>
    <div class="col-md-7">
      <h2><b>${fn:escapeXml(name)}</b></h2>
      <p>${fn:escapeXml(location)}</p>
      <p>${fn:escapeXml(info)}</p>
    </div>
  </div>
</div>


<% 
}
}  
%>
</div>
</body>
</html>
