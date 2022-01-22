package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

// 답글
public class BoardReplyWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		// session
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pseq", pseq);
		map.put("subject", subject);
		map.put("content", content);
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardReplyWrite(map);
		
		return "/board/boardReplyWrite.jsp";
	}

}
