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

<body>   

<%
    String blobkey = request.getParameter("blob-key");
    pageContext.setAttribute("blobkey", blobkey);
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
%>
<div class="container">
<form action= "/hostSuppr" method="post">
    <h2>Step two: Provide necessary information about your Suppr</h2>
${fn:escapeXml(blobkey)}
    <h3>Give your Suppr a title!</h3>
    <div><input type="text" name="title" ></div>
     <h3>Describe the event</h3>
    <div><textarea placeholder="This is a great place to state if there will be entertainment or a dresscode etc." name="description" rows="5" cols="60" >
    </textarea></div>
    <input type="hidden" name="title" value="${fn:escapeXml(title)}"/>
    <input type="hidden" name="blobkey" value="${fn:escapeXml(blobkey)}"/>
    <div><input type="submit" value="continue"/></div>

</form>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log out</a>
</div>
</body>
</html>

