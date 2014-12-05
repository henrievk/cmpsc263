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

<body>
<div class="container">   
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    //TODO: add sort?
    Query query = new Query("Suppr");
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
        pageContext.setAttribute("name", suppr.getProperty("title"));
        pageContext.setAttribute("info", suppr.getProperty("description"));

%>
  <div class="list-group">
  <a href= "/suppr.jsp?supprkey=" + supprkey class="list-group-item active">
  <h4 class="list-group-item-heading">${fn:escapeXml(name)}</h4>
  <p class="list-group-item-text">${fn:escapeXml(info)}</p>
  </a>
  </div>
<%
        }
    }
%>
</div>
</body>
</html>