package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberDAO.login(id, pwd);
		
		String loginResult = null;
		
		if(memberDTO == null) {
			loginResult="fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
		}
		
		request.setAttribute("loginResult", loginResult);
		return "/member/login.jsp";
	}

}
