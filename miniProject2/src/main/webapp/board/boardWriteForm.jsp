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

#postBtn, #resetBtn {
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

#postBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#resetBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}
input[type="text"] {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
}
textarea{
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	margin-bottom: 6px;
	resize: none;
}
</style>
	<form name="boardWriteForm" id="boardWriteForm">
		<table border="0" cellspacing="0" cellpadding="11">
			<tr>
				<td width="65" align="center">제목</td>
				<td><input type="text" name="subject" id="subject"
					placeholder="제목을 입력하세요." size="50">
					<div id="subjectDiv"></div></td>
			</tr>

			<tr>
				<td width="65" align="center">내용</td>
				<td><textarea name="content" id="content"
						placeholder="내용을 입력하세요." rows="15" cols="52"></textarea>
					<div id="contentDiv"></div></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="button"
					id="postBtn" value="글작성"> <input type="reset" id="resetBtn"
					value="다시작성"></td>
			</tr>
		</table>
	</form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$('#postBtn').click(function() {
			$('#subjectDiv').empty();
			$('#contentDiv').empty();

			if ($('#subject').val() == '') {
				$('#subjectDiv').text("제목을 입력해주세요.");
			} else if ($('#content').val() == '') {
				$('#contentDiv').text("내용을 입력해주세요.");
			} else {
				//$('#boardWriteForm').submit();
				$.ajax({
					type : 'post',
					url : '/miniProject2/board/boardWrite.do',
					data : {
						'subject' : $('#subject').val(),
						'content' : $('#content').val()
					},
					success : function() {
						alert('글쓰기 성공!');
						location.href='/miniProject2/board/boardList.do?pg=1';
						// 최신 글은 무조건 맨 위에 노출되니 1페이지로~ 고정~ 
					},
					error : function(err) {
						alert(err);
					}

				});
			}
		});
	</script>