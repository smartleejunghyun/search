package searchDB;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "searchDB/config.xml";
			//config.xml의 경로 지정
			InputStream inputStream; 
			//inputStream을 통해 inputStream 새로 만들어주기
			inputStream = Resources.getResourceAsStream(resource);
			//inputStream으로 파일 받아오기
			sqlSessionFactory =	new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
