package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 실제폴더
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println(realFolder);
		
		// 파일 업로드
		MultipartRequest multi = new MultipartRequest(request,
													  realFolder, 
													  5*1024*1024, 
													  "UTF-8"); 
													  //new DefaultFileRenamePolicy());
		                                              // 5 = 5 byte, 5*1024 = 5 kb, 5*1024*1024 = 5mb(이게 맥시멈)
		
		// 데이터
		// String imageId = request.getParameter("imageId"); - 서버에 이미지 올리기 위해 이젠 String~ 이런 식으로 데이터 받으면 안 돼
		String imageId = multi.getParameter("imageId");
		String iamgeName = multi.getParameter("imageName");
		int imagePrice=Integer.parseInt(multi.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
		String imageContent = multi.getParameter("imageContent");
		String image1 = multi.getOriginalFileName("image1");
		//String image11 = multi.getFilesystemName("image1"); // rename된 이름 갖고온다. but,,, 의미가 많이 없다고 한다.
		
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO.setImageId(imageId);
		imageboardDTO.setImageName(iamgeName);
		imageboardDTO.setImagePrice(imagePrice);
		imageboardDTO.setImageQty(imageQty);
		imageboardDTO.setImageContent(imageContent);
		imageboardDTO.setImage1(image1);
		
		// DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardWrite(imageboardDTO);
				
		// 응답 -> 원래는 목록으로 빠져야 된다.(즉 숙제)
		request.setAttribute("display", "/imageboard/imageboardWrite.jsp");
		return "/index.jsp";
	}

}
