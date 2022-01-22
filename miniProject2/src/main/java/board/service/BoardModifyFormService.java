package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardModifyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String seq = request.getParameter("seq");
		String pg = request.getParameter("pg");
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.getBoardView(Integer.parseInt(seq));
		
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);
		request.setAttribute("subject", boardDTO.getSubject());
		request.setAttribute("content", boardDTO.getContent());
		request.setAttribute("display", "/board/boardModifyForm.jsp");
		return "/index.jsp";
	}

}
