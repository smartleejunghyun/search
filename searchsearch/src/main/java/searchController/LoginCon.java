package searchController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import searchModel.userDAO;
import searchModel.userDTO;

public class LoginCon implements Command{

	
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    
    
    
    userDTO dto = new userDTO(userId, userPw);
    System.out.println(dto);
    userDAO dao = new userDAO();
    userDTO info = dao.login(dto);
    
    
    if(info!= null) {
       
       System.out.println("로그인 성공!");
       try {
		PrintWriter out = response.getWriter();
		out.print("success");
		HttpSession session = request.getSession();
		session.setAttribute("info", info);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
       
       return null;
      
      
    }else {
       System.out.println("로그인실패!");
         
    }
	return null;
    
	}
	
 }
