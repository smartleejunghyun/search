package searchModel;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class bookMarkDTO {

	public bookMarkDTO(String userId, int clNumber) {
		this.userId = userId;
		this.clNumber = clNumber;
	};
	
	
	private int wishNumber;
	private String userId;
	private int clNumber;
	private Date date;
}
