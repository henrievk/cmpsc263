<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>


<html>
    <head>
        <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css"/>
        <title>Host Suppr</title>
    </head>
    <div class="container">
    <body>
    <div class="jumbotron">
        <h2>Step 1: Upload an image for your Suppr</h2>
        <form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
            <input type="text" name="foo" style="padding-left: 100px;"><input type="file" name="myFile"style="float: right; padding-right: 100px;">
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