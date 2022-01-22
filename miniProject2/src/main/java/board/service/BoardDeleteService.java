package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.deleteBoard(seq);
		
		request.setAttribute("pg", "1"); //jquery 사용 시 seq를 보내주고 getBoardDelete jsp/service 로 보내기
		request.setAttribute("display", "/board/boardList.jsp");
		
		return "/index.jsp";
	}

}
