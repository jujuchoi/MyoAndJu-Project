package com.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess {
	// 추상 메소드
	// jsp 파일 반드시 넘겨줘야 하기 때문에 return type = String
	// Exception(예외 처리 최상위) <- Throwable(예외 부모)
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
