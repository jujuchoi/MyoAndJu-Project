package imageboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// data
		int pg = Integer.parseInt(request.getParameter("pg"));

		// DB
		int endNum = pg * 3;
		int startNum = endNum - 2;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		List<ImageboardDTO> list = imageboardDAO.getImageboardList(map);
		
		int totalA = imageboardDAO.getTotalA(); // 총글수
		ImageboardPaging imageboardPaging = new ImageboardPaging();
		imageboardPaging.setCurrentPage(pg);
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		imageboardPaging.makePagingHTML();
		
		request.setAttribute("list", list); //jQuery 아니라서 바로 list 보내면 됨,,!
		request.setAttribute("imageboardPaging", imageboardPaging.getPagingHTML());
		request.setAttribute("display", "/imageboard/imageboardList.jsp");
		request.setAttribute("pg", pg);
		return "/index.jsp";
	}

}
