<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mini project</title>
<link rel="stylesheet" href="/miniProject2/css/index.css">
</head>
<body>

	<div id="header">
		<h1 id="logo" onclick="location.href='/miniProject2/'" style="cursor:pointer;">Mini Project 2 with MVC Pattern</h1>
		<br>
		<jsp:include page="/main/menu.jsp" />
	</div>

	<div id="container">
		<div id="nav">
			<jsp:include page="/main/nav.jsp" />
		</div>

		<div id="section">
			<c:if test="${empty display}">
				<jsp:include page="/main/imgimg.jsp"/>
			</c:if>
			<c:if test="${not empty display}">
				<jsp:include page="${display}"/>
			</c:if>
		</div>
	</div>

	<div id="footer">
		<div id="footerText">
			<p>present by jujudy</p>
		</div>
	</div>

</body>
</html>