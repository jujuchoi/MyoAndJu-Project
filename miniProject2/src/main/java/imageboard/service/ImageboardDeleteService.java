package imageboard.service;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String[] check = request.getParameterValues("check");
		System.out.println(Arrays.toString(check));
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
//		for(int i = 0; i < check.length; i++) {
//			int su = imageboardDAO.imageDelete(check[i]);
//			System.out.println(su);			
//		} -> juju code
		
		// T's code
		imageboardDAO.imageboardDelete(check);
		
		// 응답
		// request.setAttribute("display", "/imageboard/imageboardDelete.jsp"); -> display로 가도 됨
		return "/miniProject2/imageboard/imageboardDelete.jsp";
	}

}
