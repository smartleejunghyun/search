package FrontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import searchController.BookmarkCon;
import searchController.BookmarkDeleteCon;
import searchController.Command;
import searchController.JoinCon;
import searchController.LoginCon;
import searchController.UpdateCon;
import searchController.deleteCon;
import searchController.idCheckCon;
import searchController.pwCheckCon;
import searchModel.userDTO;

@WebServlet("*.do")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String project = request.getContextPath();
		uri = uri.substring(project.length() + 1);
		System.out.println(uri);
		Command con = null;
		String moveURI = null;
		userDTO user = null;
		HttpSession session = request.getSession();

		
		if (uri.equals("pwCheckCon.do")) {
			con = new pwCheckCon();
		}
		
		if (uri.equals("idCheckCon.do")) {
			con = new idCheckCon();
			System.out.println("아이디 중복확인중..");
			
		}
		
		if (uri.equals("JoinCon.do")) {
			con = new JoinCon();
		} else if (uri.equals("LoginCon.do")) {
			con = new LoginCon();
		}else if (uri.equals("BookmarkCon.do")) {
			con = new BookmarkCon();
		} else if (uri.equals("BookmarkDeleteCon.do")) {
			con = new BookmarkDeleteCon();
		} else if (uri.equals("deleteCon.do")) {
			con = new deleteCon();
		} else if (uri.equals("UpdateCon.do")) {
			con = new UpdateCon();
		}

		if (uri.equals("testCon.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("recommand.jsp?clothType=dog");
			rd.forward(request, response);

		}
		if (con != null) {
			moveURI = con.execute(request, response);
		}
		if (moveURI != null) {
			RequestDispatcher rd = request.getRequestDispatcher(moveURI);
			rd.forward(request, response);

		}

	}

}
