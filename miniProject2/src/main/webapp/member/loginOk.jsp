<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap');

body{
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}
div{
	margin: 10px;
}
#notice, #Btn {
	display: flex;
	justify-content: center;
}
#modifyBtn, #logoutBtn{
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
#modifyBtn:hover{
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#logoutBtn:hover{
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
	color:red;
}

</style>
<div>
	<div id="notice">
		<h3>${sessionScope.memName}님 반갑습니다.</h3>
	</div>
	<div id="Btn">
		<input type="button" value="회원정보수정" id="modifyBtn" onclick="location.href='/miniProject2/member/modifyForm.do'">
		<input type="button" value="로그아웃" id="logoutBtn">
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$('#logoutBtn').click(function(){
	$.ajax({
		type: "post",
		url: "/miniProject2/member/logout.do",
		// 넘겨줄 데이터와 받아올 데이터는 없기 때문에 data, dataType 생략
		success: function(){
			alert('로그아웃');
			location.href='/miniProject2/';
		},
		error: function(err){
			alert(err);
		}
	});
});
</script>