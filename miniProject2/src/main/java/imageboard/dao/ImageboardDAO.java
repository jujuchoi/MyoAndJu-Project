package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {
	
	private static ImageboardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static ImageboardDAO getInstance() {
		
		synchronized(ImageboardDAO.class) {
			 if(instance == null){
				instance = new ImageboardDAO();
			}
		}
		return instance;
	}
	
	public ImageboardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("imageboardSQL.imageboardWrite", imageboardDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<ImageboardDTO> getImageboardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ImageboardDTO> list = null;
		list = sqlSession.selectList("imageboardSQL.getImageboardList", map);
		sqlSession.close();
		return list;
	}

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = 0;
		totalA = sqlSession.selectOne("imageboardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}

//	public int imageDelete(String seq) {
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		int su = 0;
//		su = sqlSession.delete("imageboardSQL.imageDelete", seq);
//		sqlSession.commit();
//		sqlSession.close();
//		return su;
//	}

	public void imageboardDelete(String[] check) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// 1번째 방법 -> 배열로 처리
//		for(int i = 0; i < check.length; i++) {
//			sqlSession.delete("", Integer.parseInt(check[i]));
//		}
//		for(String seq : check) {
//			sqlSession.delete("", seq);
//		}
		
		// 2번째 방법 -> Map으로 처리
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("check", check);
		sqlSession.delete("imageboardSQL.imageboardDelete", map);
		
		
		sqlSession.commit();
		sqlSession.close();		
	}

	public ImageboardDTO imageboardView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ImageboardDTO imageboardDTO = null;
		imageboardDTO = sqlSession.selectOne("imageboardSQL.imageboardView", seq);
		sqlSession.close();
		return imageboardDTO;
	}

}
