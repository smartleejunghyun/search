package FrontController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchController.Command;
import searchController.JoinCon;
import searchController.LoginCon;

@WebServlet("*.do")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String project = request.getContextPath();
		uri = uri.substring(project.length()+1);
		System.out.println(uri);
		Command con = null;
		String moveURI = "index.jsp";
		
		if(uri.equals("JoinCon.do")) {
			con = new JoinCon();
		}if(uri.equals("LoginCon.do")) {
			con = new LoginCon();
		}
		
		con.execute(request, response);
	}

}
