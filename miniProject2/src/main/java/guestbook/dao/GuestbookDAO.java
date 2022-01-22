package guestbook.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private static GuestbookDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static GuestbookDAO getInstance() {
		
		synchronized(GuestbookDAO.class) {
			 if(instance == null){
				instance = new GuestbookDAO();
			}
		}
		return instance;
	}

	public GuestbookDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void guestbookWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("guestbookSQL.guestbookWrite", map);
		sqlSession.commit();
		sqlSession.close();		
	}

	public List<GuestbookDTO> getGuestbookList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<GuestbookDTO> list = null;
		list = sqlSession.selectList("guestbookSQL.getGuestbookList", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = 0;
		su = sqlSession.selectOne("guestbookSQL.getTotalA");
		sqlSession.close();
		return su;
	}

	public GuestbookDTO getGuestbookView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		GuestbookDTO guestbookDTO = null;
		guestbookDTO = sqlSession.selectOne("guestbookSQL.getGuestbookView", seq);
		sqlSession.close();
		return guestbookDTO;
	}
	
}
