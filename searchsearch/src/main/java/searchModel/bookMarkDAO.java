package searchModel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import searchDB.SqlSessionManager;

public class bookMarkDAO {
	private SqlSessionFactory sqlSessionFactory = new SqlSessionManager().getSqlSession();

	// 북마크 테이블에 추가하기
	public int addBookmark(bookMarkDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);

		int row = session.insert("addBookmark", dto);

		session.close();

		return row;
	}

	// 북마크 테이블 가져오기
	public List<clothDTO> showBookmark(String userId) {
		SqlSession session = sqlSessionFactory.openSession(true);

		List<clothDTO> clothList = session.selectList("showBookmark", userId);

		session.close();

		return clothList;

	}

	// 북마크 삭제하기
	public int deleteBookmark(bookMarkDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);

		int row = session.delete("deleteBookmark", dto);

		session.close();

		return row;
	}

	// 북마크 번호들만 가져와서 북마크 체크
	public boolean checkBookmark(bookMarkDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);

		if (session.selectOne("checkBookmark", dto) != null) {
			session.close();
			return true;
		}else {
			session.close();
			return false;
		}

	

	}
}
