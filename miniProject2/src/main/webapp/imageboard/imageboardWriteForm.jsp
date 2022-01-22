<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;
	
form{
font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}

input[type="text"] {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}

textarea{
border: 1.5px #8CA6DB solid;
resize: none;
}

#imageboardWriteBtn, #resetBtn, #fileBtn {
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
#imageboardWriteBtn:hover, #resetBtn:hover, #fileBtn:hover {
	background-position: right center;
	text-decoration: none;
}

</style>
<form id="imageboardWriteForm" method="post" enctype="multipart/form-data" 
action="/miniProject2/imageboard/imageboardWrite.do">
	<h3>이미지 등록</h3>
	<table border="0" cellspacing="0" cellpadding="11">
		<tr>
			<td width="100" align="center">상품코드</td>
			<td>
				<input type="text" name="imageId" size="50">
			</td>
		</tr>
		<tr>
			<td width="100" align="center">상품명</td>
			<td>
				<input type="text" name="imageName" size="50">
			</td>
		</tr>
		<tr>
			<td width="100" align="center">단가</td>
			<td>
				<input type="text" name="imagePrice" size="50">
			</td>
		</tr>
		<tr>
			<td width="100" align="center">개수</td>
			<td>
				<input type="text" name="imageQty" size="50">
			</td>
		</tr>
		<tr>
			<td width="100" align="center">상품설명</td>
			<td>
				<textarea name="imageContent" rows="15" cols="52"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<label id="fileBtn" for="imagefile">파일 선택</label>
				<input type="file" id="imagefile" name="image1" style="display: none">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name = "imageboardWriteBtn" id="imageboardWriteBtn" value="이미지 등록"> 
				<input type="reset" id="resetBtn" value="다시작성">
			</td>
		</tr>
	</table>
</form>