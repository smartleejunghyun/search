package searchController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchModel.bookMarkDAO;
import searchModel.bookMarkDTO;

public class BookmarkCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int clNumber = Integer.valueOf(request.getParameter("clothNumber"));
		String userId = request.getParameter("userId");
		 bookMarkDTO dto = 	new bookMarkDTO(userId, clNumber);
			int row = new bookMarkDAO().addBookmark(dto);
			
			if(row>0) {
				System.out.println("즐겨찾기 추가 성공");
			}else {
				System.out.println("즐겨찾기 추가 실패");
			}
		return null;
	}

}
