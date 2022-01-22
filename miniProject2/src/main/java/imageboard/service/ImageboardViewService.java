package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// data
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// db
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		ImageboardDTO imageboardDTO = imageboardDAO.imageboardView(seq);
		
		request.setAttribute("pg", pg);
		request.setAttribute("imageboardDTO", imageboardDTO);
		request.setAttribute("display", "/imageboard/imageboardView.jsp");
		return "/index.jsp";
	}

}
