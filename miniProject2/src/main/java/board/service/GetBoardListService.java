package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// data
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// DB - 1 페이지 당 5개씩 끊어 가져오기
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		BoardDAO boardDAO = BoardDAO.getInstance(); // 싱글톤 생성
		List<BoardDTO> list = boardDAO.getBoardList(map);
			
		// session
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		// 조회수
		if(memId != null) {
			Cookie cookie = new Cookie("memHit", "쿠키있당");
			cookie.setMaxAge(30 * 60);
			response.addCookie(cookie); // client에게 쿠키 알려주기 (내 pc 브라우저)
		} // 글마다 쿠키 생성 및 소멸하고 싶으면 seq를 값에 넣어줘!
		
		// paging
		// 총 글 수
		int totalA = boardDAO.getTotalA();
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		
		boardPaging.makePagingHTML();
		
		
		// list -> JSON 변환
		JSONObject json = new JSONObject();
		
		if(list != null) {
			JSONArray jArray = new JSONArray();
			
			//for(int i = 0; i < list.size(); i++) {}
			//for(??? : list) {} // list 개수만큼 for문을 돌린다.
			
			String format = "yyyy.MM.dd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("seq", boardDTO.getSeq());
				temp.put("id", boardDTO.getId());
				temp.put("name", boardDTO.getName());
				temp.put("email", boardDTO.getEmail());
				temp.put("subject", boardDTO.getSubject());
				temp.put("content", boardDTO.getContent());
				temp.put("ref", boardDTO.getRef());
				temp.put("lev", boardDTO.getLev());
				temp.put("step", boardDTO.getStep());
				temp.put("pseq", boardDTO.getPseq());
				temp.put("reply", boardDTO.getReply());
				temp.put("hit", boardDTO.getHit());
				temp.put("logtime", sdf.format(boardDTO.getLogtime().getTime()));
				
				jArray.add(temp);
			}; // for
			json.put("list", jArray);
			
			// 세션을 json으로 바꾸기
			json.put("memId", memId);
			
			//json.put("boardPaging", boardPaging); -> 객체 전체를 넘겨도 되지만 Stringbuffer에 다 담겨있으므로 문자열만 보내도 된다.
			//json.put("boardPaging", boardPaging.getPagingHTML()+""); -> 클래스로 보내줘야 함
			json.put("boardPaging", boardPaging.getPagingHTML().toString());
			//System.out.println(json);
		} // if
		request.setAttribute("list", json);
		return "/board/getBoardList.jsp";
	}

}
