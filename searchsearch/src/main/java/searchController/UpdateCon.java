package searchController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import searchModel.userDAO;
import searchModel.userDTO;

public class UpdateCon implements Command{
   
   public String execute(HttpServletRequest request, HttpServletResponse response) {
      
	   HttpSession session = request.getSession();
	   userDTO info = (userDTO) session.getAttribute("info");
       String userPw = request.getParameter("userPw2");
       String userName= request.getParameter("userNickname");
       System.out.println("====");
       System.out.println(userPw + userName);
       userDTO dto = new userDTO(info.getUserId(), userPw, userName);
       int row = new userDAO().update(dto);
       
       if(row>0) {
    	   System.out.println("업데이트 성공");
       }else {
    	   System.out.println("업데이트 실패");
       }
       
       return "index.jsp";
         
   }

}