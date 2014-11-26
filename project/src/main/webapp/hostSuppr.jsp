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

<form action="/hostSuppr" method="post">
    <p>Give your Suppr a title!</p>
    <div><input type="text" name="title" ></div>
     <p>Describe the event. This is a great place to state if there will be entertainment or a dresscode etc.</p>
    <div><textarea name="description" rows="5" cols="60">
    </textarea></div>
    <div><input type="submit" value="Create Suppr"/></div>
    <input type="hidden" name="title" value="${fn:escapeXml(title)}"/>
</form>

<style type="text/css">
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABrkH5dNF007zNwtf1Cmt4fU8l_eSQ6gw">
    </script>
    <script type="text/javascript">
      var map;
      function initialize(location) {
      	var mapOptions = {
  		center: new google.maps.LatLng(-34.397, 150.644),
  		zoom: 8
		};
		map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);

      }
      $(document).ready(function(){
		navigator.geolocation.getCurrentPosition(initialize);
      });
    </script>
  </head>
  <body>
<div id="map-canvas"></div>
<a href="/guestbook.jsp">Back</a> 
</body>
</html>

