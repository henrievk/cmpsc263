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
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

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
            <li><a href="#">Recipies</a></li>
            <li><a href="/ListingsSuppr.jsp">Suppr listings</a></li>
            <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Logout</a></li> 
            </ul>
        </div>
    </div><!-- /.navbar-collapse -->
</nav>
<%
    String blobkey = request.getParameter("blob-key");
    pageContext.setAttribute("blobkey", blobkey);
    User user = userService.getCurrentUser();
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    String userStr= user.toString();
    pageContext.setAttribute("user", userStr);
%>
<div class="jumbotron">
<form action= "/enqueue" method="post">
    <h2>Step 2: Provide necessary information about your Suppr</h2>
    <h3>Give your Suppr a title!</h3>
    <div><input type="text" name="title" ></div>
     <h3>Describe the event</h3>
    <div><textarea rows="5" cols="60" placeholder="This is a great place to state if there will be entertainment or a dresscode etc." name="description"></textarea></div>
    <input type="hidden" name="title" value="${fn:escapeXml(title)}"/>
    <input type="hidden" name="blobkey" value="${fn:escapeXml(blobkey)}"/>
    <input type="hidden" name="user" value="${fn:escapeXml(user)}"/>
    <div><input type="submit" value="continue"/></div>

</form>
</div>

<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log out</a>
</div>
</body>
</html>

