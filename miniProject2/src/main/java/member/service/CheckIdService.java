package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean exist = memberDAO.isExistId(id);
		
		if(exist) {
			return "/member/checkIdFail.jsp";
		} else {
			return "/member/checkIdOk.jsp";
		}
		
	}

}
