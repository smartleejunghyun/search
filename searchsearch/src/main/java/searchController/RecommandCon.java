package searchController;

import java.util.List;

import searchModel.clothDAO;
import searchModel.clothDTO;

public class RecommandCon {
	public static void main(String[] args) {

		List<clothDTO> dtoList = new clothDAO().show("캐주얼");
		for(clothDTO dto : dtoList) {
			System.out.println(dto.getNumber());
		}

	}
}