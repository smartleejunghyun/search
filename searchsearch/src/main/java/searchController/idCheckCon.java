package searchController;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchModel.userDAO;

public class idCheckCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
	      System.out.println("userId = "+userId);
	      
	      boolean result = new userDAO().idCheck(userId);
	      
	      try {
	         
	         PrintWriter out = response.getWriter();
	         out.print(result);
	         System.out.println("아이디 체크");
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	}

}
