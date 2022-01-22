package guestbook.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class GuestbookListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// data
		String pg = request.getParameter("pg");
		
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/guestbook/guestbookList.jsp");
		
		return "/index.jsp";
	}

}
