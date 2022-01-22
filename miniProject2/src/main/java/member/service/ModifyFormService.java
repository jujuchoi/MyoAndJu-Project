package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class ModifyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberDAO.modifyInfo(id);
		
		session.setAttribute("memInfo", memberDTO);
		request.setAttribute("display", "/member/modifyForm.jsp");
		return "/index.jsp";
	}

}
