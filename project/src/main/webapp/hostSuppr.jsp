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
    <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.min.css"/>
</head>

<body>   

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    //add supprkey?
    Query query = new Query("Suppr").addSort("date", Query.SortDirection.DESCENDING);
    List<Entity> supprs = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(5));
    if (supprs.isEmpty()) {
%>

<p>There are no Supprs to show right now.</p>

<%
} else {
%>

<p>Current Supprs:</p>

<%
    for (Entity suppr : supprs) {
%>
<p><b>suppr</p>
<%
        }
    }
%>



<form action="/hostSuppr" method="post">
    <p>Give your Suppr a title!</p>
    <div><input type="text" name="title" ></div>
     <p>Describe the event. This is a great place to state if there will be entertainment or a dresscode etc.</p>
    <div><textarea name="description" rows="5" cols="60">
    </textarea></div>
    <div><input type="submit" value="Create Suppr"/></div>
    <input type="hidden" name="title" value="${fn:escapeXml(title)}"/>
</form>
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log out</a>
</body>
</html>

