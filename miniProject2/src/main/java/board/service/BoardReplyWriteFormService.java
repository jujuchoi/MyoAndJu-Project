package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardReplyWriteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String pseq = request.getParameter("seq"); // 원글번호
		String pg = request.getParameter("pg"); // 원글 페이지 번호
		
		request.setAttribute("pseq", pseq);
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardReplyWriteForm.jsp");
		return "/index.jsp";
	}

}
