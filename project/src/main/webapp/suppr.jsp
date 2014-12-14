
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

<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css"/>
</head>
<body>
<%
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    String supprName = request.getParameter("supprkey");
    pageContext.setAttribute("supprkey", supprName);
    System.out.println(supprName);
    //System.out.println("supprname from supprID" +supprName +" OR URL: " + url);
    if (supprName == null) {
%>
Something went wrong
<%
    }
    else{
    Filter propertyFilter =new FilterPredicate("supprkey", FilterOperator.EQUAL, supprName);
    Query q = new Query("Suppr").setFilter(propertyFilter);
    List<Entity> supprs = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(30));
    for (Entity suppr : supprs) {
        pageContext.setAttribute("name", suppr.getProperty("title"));
        pageContext.setAttribute("info", suppr.getProperty("description"));
    }

    //Key    supprKey = KeyFactory.stringToKey(supprName);
    //Entity suppr    = datastore.get(supprKey);
    //pageContext.setAttribute("name", suppr.getProperty("title"));
    //pageContext.setAttribute("info", suppr.getProperty("description"));


    //if (supprs.isEmpty()) {
    //Filter propertyFilter =new FilterPredicate("supprkey", FilterOperator.EQUAL, supprName);
    //Query q = new Query("Suppr").setFilter(propertyFilter);
    //List<Entity> supprs = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(30));
%>

<div class="container">   

<div class="jumbotron">
        <h2><b>${fn:escapeXml(name)}</b></h2>
        <p>${fn:escapeXml(info)}</p>
</div>
</div>
<div class="container">   
</div>

<div class="jumbotron">
        <h2><b>${fn:escapeXml(name)}</b></h2>
        <p>${fn:escapeXml(info)}</p>
        <a <button type="button" class="btn btn-lg btn-danger" href="/join">joinfixthis</a></button><br>
        </div>
</div>

<% 
}  
%>
</body>
</html>
