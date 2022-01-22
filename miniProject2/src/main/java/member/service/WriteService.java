package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class WriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPwd(request.getParameter("pwd"));
		memberDTO.setGender(request.getParameter("gender"));
		memberDTO.setEmail1(request.getParameter("email1"));
		memberDTO.setEmail2(request.getParameter("email2"));
		memberDTO.setTel1(request.getParameter("tel1"));
		memberDTO.setTel2(request.getParameter("tel2"));
		memberDTO.setTel3(request.getParameter("tel3"));
		memberDTO.setZipcode(request.getParameter("zipcode"));
		memberDTO.setAddr1(request.getParameter("addr1"));
		memberDTO.setAddr2(request.getParameter("addr2"));
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.write(memberDTO);
				
		return "/member/write.jsp";
	}

}
