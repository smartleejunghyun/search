package searchModel;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import searchDB.SqlSessionManager;

public class userDAO {
	private SqlSessionFactory sqlSessionFactory = new SqlSessionManager().getSqlSession();

	// 회원가입
	public int join(userDTO dto) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("join", dto);
		
		session.close();
		return row;

	}

	// 로그인
	public userDTO login(userDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);

		userDTO info = session.selectOne("login", dto);

		session.close();
		return info;
	}

	// ID 중복확인

	public boolean idCheck(String userId) {
		boolean result = false;
		SqlSession session = sqlSessionFactory.openSession(true);
		String Id = session.selectOne("idCheck", userId);
		System.out.println(Id);
		if (Id != null) {
			result = true;
		}

		return result;

	}

	// ID정보 업데이트
	public int update(userDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);

		int row = session.update("update", dto);
		session.close();
		return row;
	}

	// PW동일한지 체크
	public String pwCheck(userDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String pw = session.selectOne("pwCheck", dto);
		if (pw != null) {
			session.close();
			return pw;
		} else {
			session.close();
			return null;
		}

	}
	

	
}
