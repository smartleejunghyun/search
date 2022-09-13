package searchController;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchModel.userDAO;
import searchModel.userDTO;

public class JoinCon implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");

		System.out.println(userId + userPw + userName);

		userDTO dto = new userDTO(userId, userPw, userName);
		int row = new userDAO().join(dto);
		
		if(row>0) {
			try {
				PrintWriter out = response.getWriter();
				out.print("success");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}else {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print("fail");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return null;
	}

}