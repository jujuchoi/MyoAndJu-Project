<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

.mainNav {
	background-color: #F2F7FB;
	color: #02343F;
	list-style: none;
}

.mainNav li {
	display: inline-block;
	font-weight: bold;
	font-size: 16px;
	font-family: 'Noto Sans KR', 'Raleway', sans-serif;
	color: black;
	margin: 10px 20px;
	padding: 15px 45px;
	text-align: center;
	text-transform: uppercase;
	transition: 0.5s;
	background-size: 200% auto;
	background-image: linear-gradient(to right, #B993D6 0%, #8CA6DB 51%, #B993D6 100%);
	box-shadow: 0 0 20px #eee;
	border-radius: 10px;
	text-decoration: none;
}

.mainNav li:hover {
	background-position: right center;
	text-decoration: none;
}

.mainNav li a {
	display: block;
	text-decoration: none;
}

.mainNav li a:hover {
	color: white;
}
</style>
<ul class="mainNav">
	<c:if test="${memName != null}">
		<li class="btn-grad"><a href="/miniProject2/board/boardWriteForm.do">글쓰기</a></li>
		<li class="btn-grad"><a href="/miniProject2/imageboard/imageboardWriteForm.do">이미지 등록</a></li>
		<li class="btn-grad"><a href="/miniProject2/guestbook/guestbookWriteForm.do">방명록 쓰기</a></li>
	</c:if>
	<li class="btn-grad"><a href="/miniProject2/board/boardList.do?pg=1">글 목록</a></li>
	<li class="btn-grad"><a href="/miniProject2/imageboard/imageboardList.do?pg=1">이미지 목록</a></li>
	<li class="btn-grad"><a href="/miniProject2/guestbook/guestbookList.do?pg=1">방명록 목록</a></li>
</ul>
