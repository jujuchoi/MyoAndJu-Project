<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;
#imageboardViewForm{
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}
	
#imgListBtn {
	font-family: 'Noto Sans KR', 'Raleway', sans-serif;
	margin: 2px 15px;
	padding: 4px 7px;
	text-align: center;
	text-transform: uppercase;
	transition: 0.5s;
	background-size: 200% auto;
	background-image: linear-gradient(to right, #B993D6 0%, #8CA6DB 51%, #B993D6 100%);
	box-shadow: 0 0 20px #eee;
	border-radius: 5px;
	border: none;
	color: white;
}
	
#imgListBtn:hover{
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}
table{
	margin: 10px;
}
td img {
max-width: 100%;
}
</style>
<from id="imageboardViewForm">
<input type="hidden" id="pg" value="${pg}">
<table border="1" cellspacing="0" cellpadding="11">
	<tr>
		<td align="center" rowspan="4"><img src="/miniProject2/storage/${imageboardDTO.image1}" alt="${imageboardDTO.imageName}"></td>
		<td align="center">상품명</td>
		<td align="center">${imageName}</td>
	</tr>
	<tr>
		<td align="center">단가</td>
		<td align="center"><fmt:formatNumber pattern="#,###">${imagePrice}</fmt:formatNumber></td>
	</tr>
	<tr>
		<td>개수</td>
		<td><fmt:formatNumber pattern="#,###">${imageQty}</fmt:formatNumber></td>
	</tr>
	<tr>
		<td>합계</td>
		<td><fmt:formatNumber pattern="#,###">(${imagePrice} * ${imageQty})</fmt:formatNumber></td>
	</tr>
	<tr>
		<td colspan="3" valign="top" text-align="left" height="80"><pre>${imageContent}</pre></td>
	</tr>
</table>
<div>
	<input type="button" id="imgListBtn" style="float: left;" value="목록" onclick="location:href='/miniProject2/imageboard/imageboardList.do?pg=${pg}"/>
</div>

</from>