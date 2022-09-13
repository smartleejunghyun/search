package searchController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import searchModel.userDAO;
import searchModel.userDTO;

public class pwCheckCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		userDTO info = (userDTO) session.getAttribute("info");
		String userPw  = request.getParameter("currentPw");
		info.setUserPw(userPw);
		String pw = new userDAO().pwCheck(info);
		
		try {
			PrintWriter out = response.getWriter();
			if(pw!=null) {
			out.print("success");
			}else {
				out.print("fail");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		return null;
	}

}
