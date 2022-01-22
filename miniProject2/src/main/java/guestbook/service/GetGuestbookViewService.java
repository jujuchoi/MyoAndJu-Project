package guestbook.service;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;
import net.sf.json.JSONObject;

public class GetGuestbookViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		// DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		GuestbookDTO guestbookDTO = guestbookDAO.getGuestbookView(seq);
		
		// BOARDDTO -> JSON
		JSONObject json = new JSONObject();
		
		if(guestbookDTO != null) {
			String format = "yyyy.MM.dd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			
			json.put("seq", guestbookDTO.getSeq());
			json.put("name", guestbookDTO.getName());
			json.put("logtime", sdf.format(guestbookDTO.getLogtime().getTime()));
			json.put("email", guestbookDTO.getEmail());
			json.put("homepage", guestbookDTO.getHomepage());
			json.put("subject", guestbookDTO.getSubject());
			json.put("content", guestbookDTO.getContent());
		};
		
		request.setAttribute("guestbook", json);
		return "/guestbook/getGuestbookView.jsp";
	}

}
