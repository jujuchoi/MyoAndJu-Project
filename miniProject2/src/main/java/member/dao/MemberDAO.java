package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {	
	private static MemberDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static MemberDAO getInstance() {
		
		synchronized(MemberDAO.class) {
			 if(instance == null){
				instance = new MemberDAO();
			}
		}
		return instance;
	}
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 회원 정보 관련
		// 로그인
		public MemberDTO login(String id, String pwd) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pwd", pwd);
			MemberDTO memberDTO = null;
			SqlSession sqlSession = sqlSessionFactory.openSession();
			memberDTO = sqlSession.selectOne("memberSQL.login", map);
			sqlSession.close();
			return memberDTO;
		}
		
		// 아이디 중복 체크
		public boolean isExistId(String id) {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
			// count(*)로 리턴받을 경우 memberDTO 대신 int를 받으면 된다.
			if(memberDTO == null) {
				return false; // 사용 가능
			} else {
				return true; // 사용 불가능
			}
		}
		
		// 회원정보 수정 표시
		public MemberDTO modifyInfo(String id) {
			MemberDTO memberDTO = null;
			SqlSession sqlSession = sqlSessionFactory.openSession();
			memberDTO = sqlSession.selectOne("memberSQL.modifyInfo", id);
			sqlSession.close();	
			return memberDTO;
		}
		
		// 정보 수정
		public void modify(MemberDTO memberDTO) {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("memberSQL.modify", memberDTO);
			sqlSession.commit();
			sqlSession.close();	
		}
		
		// 회원가입
		public void write(MemberDTO memberDTO) {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("memberSQL.write", memberDTO);
			sqlSession.commit();
			sqlSession.close();
		}
}
