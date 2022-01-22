<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap');
body{
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}
table{
	justify-content: center;
	margin: 10px;
}
#loginForm div{
	color: #B993D6;
	font-size: 10px;
	font-weight: bold;
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
	padding: 2px;
	margin: 1px;
}
#loginBtn, #writeBtnlo{
	font-family: 'Noto Sans KR','Raleway', sans-serif;
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

#loginBtn:hover{
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#writeBtnlo:hover{
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#loginForm #id, #loginForm #pwd{
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
}
input[type="text"] {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
}
input[type="password"] {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
}
</style>
<div id="loginBox">
<form id="loginForm">
<table border="0" cellspacing="0" cellpadding="5">
	    <tr>
			<td width="100" align="center">아이디</td>
			<td>
				<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
				<div id="idDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd" id="pwd" size="30" placeholder="비밀번호 입력">
				<div id="pwdDiv"></div>
			</td>	
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="loginBtn" value="로그인">
				<input type="button" id="writeBtnlo" value="회원가입" onclick="location.href='/miniProject2/member/writeForm.do'">
			</td>
		</tr>
</table>
<div id="loginResult">
</div>
</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$('#loginForm #loginBtn').click(function(){
	$('#loginForm #idDiv').empty();
	$('#loginForm #pwdDiv').empty();
	
	if($('#loginForm #id').val() == ''){
		$('#loginForm #idDiv').text("아이디를 입력해주세요.");
	} else if($('#loginForm #pwd').val() == ''){
		$('#loginForm #pwdDiv').text("비밀번호를 입력해주세요.");
	} else {
		$.ajax({
			type: "post",
			url: "/miniProject2/member/login.do",
			data: {'id':$('#loginForm #id').val(), 'pwd':$('#loginForm #pwd').val()},
			dataType: 'text',
			success:function(data){
				data = data.trim();
				alert(data); //--> 데이터 들어오는지 확인하기
				if(data == "ok"){
					location.href="/miniProject2/";					
				} else if(data == "fail"){
					$('#loginResult').css('font-size', '15px');
					$('#loginResult').css('font-weight', 'bold');
					$('#loginResult').css('color', 'red');
					$('#loginResult').text('아이디/비밀번호를 확인해주세요.');
				}
			},
			error:function(err){
				alert(err);
			}
		})
	}
});
</script>