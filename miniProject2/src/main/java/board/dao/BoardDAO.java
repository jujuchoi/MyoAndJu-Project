package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static BoardDAO getInstance() {
		
		synchronized(BoardDAO.class) {
			 if(instance == null){
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = null;
		list = sqlSession.selectList("boardSQL.getBoardList", map);
		sqlSession.close();
		return list;
	}

	public BoardDTO getBoardView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = null;
		boardDTO = sqlSession.selectOne("boardSQL.getBoardView", seq);
		sqlSession.close();
		return boardDTO;
		
	}

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = 0;
		totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}

	public void boardModify(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardModify", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void deleteBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("boardSQL.getBoardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardReplyWrite(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// 원글 필요
		int pseq = (int) map.get("pseq");
		BoardDTO boardDTO = this.getBoardView(pseq);
		sqlSession.update("boardSQL.boardReplyWrite1", boardDTO);
		map.put("ref", boardDTO.getRef()); // 만약 value 데이터 타입도 String이면 +""을 붙여서 문자열화 한다.
		map.put("lev", boardDTO.getLev()+1);
		map.put("step", boardDTO.getStep()+1);
		sqlSession.insert("boardSQL.boardReplyWrite2", map);
		sqlSession.update("boardSQL.boardReplyWrite3", pseq);
		sqlSession.commit();
		sqlSession.close();		
	}

	public void getBoardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("boardSQL.getBoardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardHit(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardHit", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
}
