package searchController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchModel.bookMarkDAO;
import searchModel.bookMarkDTO;

public class BookmarkDeleteCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		int clothNumber = Integer.valueOf(request.getParameter("clothNumber"));
		bookMarkDTO dto = new bookMarkDTO(userId, clothNumber);
		int row = new bookMarkDAO().deleteBookmark(dto);
		
		if(row>0) {
			System.out.println("북마크 삭제 성공");
		}else {
			System.out.println("북마크 삭제 실패");
		}
		
		
		return null;
	}

}
