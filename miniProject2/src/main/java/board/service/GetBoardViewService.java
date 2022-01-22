package board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import net.sf.json.JSONObject;

public class GetBoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		Cookie[] cookies = request.getCookies();
		
		System.out.println(cookies);
		// DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		
//		if(cookies == null || cookies.length == 0) {
//			boardDAO.boardHit(seq);
//		}
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("memHit")) {
					boardDAO.boardHit(seq);
					
					cookies[i].setMaxAge(0); // 쿠키 삭제
					response.addCookie(cookies[i]); // 클라이언트에게 알리기
				}
			}
		}
		
		BoardDTO boardDTO = boardDAO.getBoardView(seq);
		
		// BOARDDTO -> JSON
		JSONObject json = new JSONObject();
		
		if(boardDTO != null) {
			json.put("seq", boardDTO.getSeq());
			json.put("id", boardDTO.getId());
			json.put("name", boardDTO.getName());
			json.put("email", boardDTO.getEmail());
			json.put("subject", boardDTO.getSubject());
			json.put("content", boardDTO.getContent());
			json.put("ref", boardDTO.getRef());
			json.put("lev", boardDTO.getLev());
			json.put("step", boardDTO.getStep());
			json.put("pseq", boardDTO.getPseq());
			json.put("reply", boardDTO.getReply());
			json.put("hit", boardDTO.getHit());
			json.put("logtime", boardDTO.getLogtime());
		}
		
		// session
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		json.put("memId", memId);
		request.setAttribute("memId", memId);
		request.setAttribute("board", json);
		return "/board/getBoardView.jsp";
	}

}
