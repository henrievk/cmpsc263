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
    User user = userService.getCurrentUser();
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    //TODO: add sort?
    Query query = new Query("Suppr");
%> 
<%
    List<Entity> supprs = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(30));
    if (supprs.isEmpty()) {
%>

<p>There are no Supprs to show right now.</p>

<%
} else {
%>

<p>Current Supprs:</p><br>
<%
    for (Entity suppr : supprs) {
        pageContext.setAttribute("supprID", suppr.getProperty("supprkey"));
        pageContext.setAttribute("name", suppr.getProperty("title"));
        pageContext.setAttribute("info", suppr.getProperty("description"));
        System.out.println(suppr.getProperty("supprkey"));
        //"/suppr.jsp?supprID=${fn:escapeXml(supprkey)}"

%>
  <div class="list-group">
  <a href= "/suppr.jsp?supprkey=${fn:escapeXml(supprID)}" class="list-group-item active">
  <h4 class="list-group-item-heading">${fn:escapeXml(name)}</h4>
  <p class="list-group-item-text">${fn:escapeXml(info)}</p>
  </a>
  </div>
  <p> ${fn:escapeXml(supprID)} </p>
<%
  }
}
%>
</div>
</body>
</html>