package searchModel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import searchDB.SqlSessionManager;

public class clothDAO {
	private SqlSessionFactory sqlSessionFactory = new SqlSessionManager().getSqlSession();

	public List<clothDTO> show(String type) {

		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<clothDTO> dto =  session.selectList("show", type);
		System.out.println(dto);

		session.close();
		return dto;

	}
}
