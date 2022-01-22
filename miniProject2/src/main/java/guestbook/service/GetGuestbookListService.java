package guestbook.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import guestbook.bean.GuestbookDTO;
import guestbook.bean.GuestbookPaging;
import guestbook.dao.GuestbookDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetGuestbookListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// data
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// db
		int endNum = pg * 3;
		int startNum = endNum - 2;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		List<GuestbookDTO> list = guestbookDAO.getGuestbookList(map);
		System.out.println(list);
		
		int totalA = guestbookDAO.getTotalA();
		GuestbookPaging guestbookPaging = new GuestbookPaging();
		guestbookPaging.setCurrentPage(pg);
		guestbookPaging.setPageBlock(3);
		guestbookPaging.setPageSize(3);
		guestbookPaging.setTotalA(totalA);
		
		guestbookPaging.makePagingHTML();
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			JSONArray jArray = new JSONArray();
			
			String format = "yyyy.MM.dd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			
			for(GuestbookDTO guestbookDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("seq", guestbookDTO.getSeq());
				temp.put("name", guestbookDTO.getName());
				temp.put("email", guestbookDTO.getEmail());
				temp.put("homepage", guestbookDTO.getHomepage());
				temp.put("subject", guestbookDTO.getSubject());
				temp.put("content", guestbookDTO.getContent());
				temp.put("logtime", sdf.format(guestbookDTO.getLogtime().getTime()));
				
				jArray.add(temp);
			
			};
			json.put("list", jArray);			
			json.put("guestbookPaging", guestbookPaging.getPagingHTML().toString());
		};
		
		// session
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
				
		json.put("memId", memId);
		System.out.println(json);
		
		request.setAttribute("list", json);
		return "/guestbook/getGuestbookList.jsp";
	}

}
