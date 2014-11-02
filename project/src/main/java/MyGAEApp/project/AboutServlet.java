package MyGAEApp.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AboutServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		req.getRequestDispatcher("about.jsp").forward(req, resp);
		}
}
