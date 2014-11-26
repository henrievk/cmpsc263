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
	<title>Let's seeee </title>
</head>

<body>

	<%
		UserService userService = UserServiceFactory.getUserService();
	User currentUser = userService.getCurrentUser();
	if (currentUser != null) {
	%>
		This will be printed if parameter myparam equals with myvalue
	<%
		} 
		else {
	%>
		This will be printed if parameter myparam DOES NOT equal with myvalue
	<%
		}
	%>

</body>
</html>