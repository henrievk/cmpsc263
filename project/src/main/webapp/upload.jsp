<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
    UserService userService = UserServiceFactory.getUserService();
%>


<html>
    <head>
        <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css"/>
        <link rel="import" href="WEB-INF/header.html">
        <title>Host Suppr</title>
    </head>
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
    <body>
    <div class="jumbotron">
        <h2>Step 1: Upload an image for your Suppr</h2>
        <form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
            <input type="text" name="foo" style="padding-left: 100px;"><input type="file" name="myFile" style="padding-left: 385px;">
            <input type="submit" value="Next">
        </form>

        <h3>(Or skip this step)</h3>
        <form action="/hostSuppr.jsp?blob-key=none">
            <input type="submit" value="Skip">
        </form>
    </div>
    </body>
    </div>
</html>