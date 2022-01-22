<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;
#guestbookViewForm{
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}
	
#gbListBtn {
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
	
#gbListBtn:hover{
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}
table{
	margin: 10px;
}
</style>
<form id="guestbookViewForm">
<input type="hidden" id="pg" name="pg" value="${pg}">
<input type="hidden" id="seq" name="seq" value="${seq}">
<table id="guestbookView" border="1" cellspacing="0" cellpadding="11">
	<tr>
		<td width="100">작성자</td>
		<td width="100" id="gbName"></td>
		<td width="100">작성일</td>
		<td width="100" id="gbDate"></td>
	</tr>
	<tr>
		<td width="100">이메일</td>
		<td id="gbEmail" colspan='3'></td>
	</tr>
	<tr>
		<td width="100">홈페이지</td>
		<td id="gbHome" colspan='3'></td>
	</tr>
	<tr>
		<td width="100">제목</td>
		<td id="gbSub" colspan='3'></td>
	</tr>
	<tr>
		<td id="gbCon" height="80" valign="top" colspan='4'></td>
	</tr>
</table>
<input type="button" value="목록" id="gbListBtn" onclick="location.href='/miniProject2/guestbook/guestbookList.do?pg=${pg}'"/>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject2/guestbook/getGuestbookView.do',
		data: 'seq='+$('#seq').val(),
		dataType: 'json',
		success: function(data){
			$('#gbName').text(data.name);
			$('#gbDate').text(data.logtime);
			$('#gbEmail').text(data.email);
			$('#gbHome').text(data.homepage);
			$('#gbSub').text(data.subject);
			$('#gbCon').text(data.content);
		},
		error: function(err){
			alert(err);
		}
	});
});
</script>