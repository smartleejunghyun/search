package searchController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import searchModel.bookMarkDAO;
import searchModel.clothDTO;
import searchModel.userDTO;

public class showBookmarkCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		userDTO info = (userDTO) request.getAttribute("info");
		List<clothDTO> clothList = new bookMarkDAO().showBookmark(info.getUserId());

	
		return null;
		
	}

}
