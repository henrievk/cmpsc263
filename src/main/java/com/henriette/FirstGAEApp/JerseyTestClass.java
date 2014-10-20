package com.henriette.FirstGAEApp;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/jerseyws")
public class JerseyTestClass {

    @GET
    @Path("/test")
    public String testMethod() {
        return "this is a test";
    }
}
