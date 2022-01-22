package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns = {"*.do"},
		initParams = {
				@WebInitParam(name="propertyConfig", value="command.properties")
		}
	)
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Object> map = new HashMap<String, Object>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig");
		System.out.println("propertyConfig = " + propertyConfig);

		String realFolder = config.getServletContext().getRealPath("/WEB-INF");
		String realPath = realFolder + "/" + propertyConfig;
		System.out.println("realPath = " + realPath);

		FileInputStream fin = null;
		Properties properties = new Properties();

		try {
			//fin = new FileInputStream(propertyConfig); // 파일 읽어와!
			fin = new FileInputStream(realPath);

			properties.load(fin); // properties라는 외부 파일에 집어 넣음 -> {/member/writeForm.do=mini.service.WriteFormService, /member/loginForm.do=mini.service.LoginFormService,...}
			System.out.println("properties = " + properties);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println();

		Iterator it = properties.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			System.out.println("key = " + key);

			String className = properties.getProperty(key);
			System.out.println("className = " + className);

			try {
				Class<?> classType = Class.forName(className); // 클래스 타입으로 변환
				Object ob = classType.newInstance(); // Object 타입으로 생성

				System.out.println("ob = " + ob);

				map.put(key, ob);

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			}

			System.out.println();
		} // while
	}// init

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		if (request.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
		}
		
		String category = request.getServletPath();
		System.out.println("category: " + category);

		CommandProcess com = (CommandProcess) map.get(category); // jsp 로 넘어와야 해당 파일로 forward 하기 때문에 역할이 없더라도 jsp 파일을 만들었던 것!
		String view = null;

		try {
			view = com.requestPro(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}

		// forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response); // 제어권 넘기기

	}

}
