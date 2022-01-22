package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class GetBoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// data
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		// db
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.getBoardDelete(seq);
		
		return "/board/getBoardDelete.jsp";
	}

}
