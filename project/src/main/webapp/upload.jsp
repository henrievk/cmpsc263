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
        <h2>Step 1: Upload an image for your Suppr</h2>
        <form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
            <input type="text" name="foo">
            <input type="file" name="myFile"><br>
            <input type="submit" value="Next">
        </form>

        <h2>Or skip this step</h2>
        <a <button type="button" class="btn btn-xs btn-default" href="/hostSuppr?blob-key=none" >Skip</a></button><br>
        </div>
    </body>
    </div>
</html>