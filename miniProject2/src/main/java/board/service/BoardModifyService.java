package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardModifyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// data
		int seq = Integer.parseInt(request.getParameter("seq"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subject", subject);
		map.put("content", content);
		map.put("seq", seq);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardModify(map);
		
		String pg = request.getParameter("pg");
		
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);
		
		return "/board/boardModify.jsp";
		
	}
}
