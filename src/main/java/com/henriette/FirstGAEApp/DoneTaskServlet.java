//Find out if this class is even needed when Enqueue exists
package com.henriette.FirstGAEApp;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoneTaskServlet extends HttpServlet {
	@Override
	  public void doGet(HttpServletRequest req, HttpServletResponse resp)
	      throws IOException {
		resp.sendRedirect("/done.html");

	  }
}
