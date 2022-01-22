<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap');

body {
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}

#guestbookWriteForm div {
	color: #B993D6;
	font-size: 10px;
	font-weight: bold;
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
	padding: 2px;
	margin: 1px;
}

#guestbookPostBtn {
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

#guestbookWriteForm #resetBtn{
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

#guestbookWriteForm #listBtn {
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

#guestbookPostBtn:hover {
	background-position: right center;
	text-decoration: none;
}

#guestbookWriteForm #resetBtn:hover {
	background-position: right center;
	text-decoration: none;
}

#listBtn:hover {
	background-position: right center;
	text-decoration: none;
}

input[type="text"] {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
}
textarea{
	font-family: 'Noto Sans KR', 'Raleway', sans-serif;
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	margin-bottom: 6px;
	resize: none;
}
</style>
<form name="guestbookWriteForm" id="guestbookWriteForm">
	<table cellspacing="0" cellpadding="11">
		<tr>
			<td width="65" align="center">작성자</td>
			<td><input type="text" id="name" name="name" placeholder="작성자 입력" size="50">
			<div id="nameDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="65" align="center">이메일</td>
			<td><input type="text" id="email" name="email" placeholder="이메일 입력" size="50">
			<div id="emailDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="65" align="center">홈페이지</td>
			<td><input type="text" id="homepage" name="homepage" value="http://" size="50">
			<div id="homepageDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="65" align="center">제목</td>
			<td><input type="text" id="subject" name="subject" placeholder="제목 입력" size="50">
			<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="65" align="center">내용</td>
			<td><textarea name="content" id="content" placeholder="내용 입력" rows="15" cols="60"></textarea>
			<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="guestbookPostBtn" value="방명록 작성"> 
				<input type="reset" id="resetBtn" value="다시작성">
				<input type="button" id="listBtn" value="방명록 목록">
			</td>
		</tr>
	</table>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$('#guestbookPostBtn').click(function(){
		$('#guestbookWriteForm #subjectDiv').empty();
		$('#guestbookWriteForm #contnetDiv').empty();
		
		if($('#guestbookWriteForm #subject').val() == ''){
			$('#guestbookWriteForm #subjectDiv').text('제목을 입력해주세요.');
		} else if($('#guestbookWriteForm #content').val() == ''){
			$('#guestbookWriteForm #contentDiv').text('내용을 입력해주세요.');
		} else {
			$.ajax({
				type: 'post',
				url: '/miniProject2/guestbook/guestbookWrite.do',
				data: {
					'name': $('#guestbookWriteForm #name').val(),
					'email': $('#guestbookWriteForm #email').val(),
					'homepage': $('#guestbookWriteForm #homepage').val(),
					'subject': $('#guestbookWriteForm #subject').val(),
					'content': $('#guestbookWriteForm #content').val()
				},
				success : function(){
					location.href='/miniProject2/guestbook/guestbookList.do?pg=1';
				},
				error: function(err){
					alert(err);
				}
			});
		};
	});
	
	$('#listBtn').click(function(){
		location.href='/miniProject2/guestbook/guestbookList.do?pg=1';
	});
</script>