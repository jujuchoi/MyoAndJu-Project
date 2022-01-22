<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;

body {
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}

#boardWriteForm div {
	color: #B993D6;
	font-size: 10px;
	font-weight: bold;
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
	padding: 2px;
	margin: 1px;
}

#boardModifyBtn, #resetBtn {
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

#boardModifyBtn:hover, #resetBtn:hover {
	background-position: right center;
	text-decoration: none;
}

input[type="text"] {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}

textarea {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	margin-bottom: 6px;
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}
</style>
<form name="boardModifyForm" id="boardModifyForm">
	<input type="hidden" id="pg" name="pg" value="${pg}">
	<input type="hidden" id="seq" name="seq" value="${seq}">
	<table border="0" cellspacing="0" cellpadding="11">
		<tr>
			<td width="65" align="center">제목</td>
			<td>
			<input type="text" name="subject" id="subject" placeholder="${subject}" size="50">
			<div id="subjectModifyDiv"></div>
			</td>
		</tr>

		<tr>
			<td width="65" align="center">내용</td>
			<td>
			<textarea name="content" id="content" placeholder="${content}" rows="15" cols="52"></textarea>
			<div id="contentModifyDiv"></div>
			</td>
		</tr>

		<tr>
			<td colspan="2" align="center">
			<input type="button" name = "boardModifyBtn" id="boardModifyBtn" value="글수정"> 
			<input type="reset" id="resetBtn" value="다시작성">
			</td>
		</tr>
	</table>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
console.log($('#pg').val());
console.log($('#seq').val());

		$('#boardModifyBtn').click(function(){
			$('#subjectModifyDiv').empty();
			$('#contentModifyDiv').empty();
			
			if($('#boardModifyForm #subject').val() == ''){
				$('#subjectModifyDiv').text('제목을 입력해주세요.');
			} else if($('#boardModifyForm #content').val() == ''){
				$('#contentModifyDiv').text('내용을 입력해주세요.');
			} else {
				$.ajax({
					type: 'post',
					url: '/miniProject2/board/boardModify.do',
					data: {
						'pg': $('#pg').val(),
						'seq': $('#seq').val(),
						'subject': $('#boardModifyForm #subject').val(),
						'content': $('#boardModifyForm #content').val()
					},
					success: function(){
						alert("글 수정 완료!");
						location.href='/miniProject2/board/boardView.do?seq=' + $('#seq').val() + '&pg=' + $('#pg').val();
					},
					error: function(err){
						alert(err);
					}
				});
			}
			
			
		});
		
</script>