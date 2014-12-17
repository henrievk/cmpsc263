<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
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
    <div class="jumbotron">
        <h2>Done!</h2>
        <h3>Your Suppr was successfully created. You can view it in "My Supprs"<br>
        What do you want to do now?<h3><br>

        <p><a <button type="button" class="btn btn-lg btn-danger" href="/mySupprs.jsp">View my Suppr </a></button>
        <a <button type="button" class="btn btn-lg btn-danger" href="/ListingsSupprs.jsp">Join a Suppr</a></button>
        <a <button type="button" class="btn btn-lg btn-danger" href="/home">Take me home</a></button><br>
    </div>
    </body>
    </div>
</html>