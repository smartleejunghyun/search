package searchController;

import java.util.List;

import searchModel.bookMarkDAO;
import searchModel.bookMarkDTO;
import searchModel.clothDTO;

public class testController {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<clothDTO> clothList = new bookMarkDAO().showBookmark("2");

	
		
	
	}

}
