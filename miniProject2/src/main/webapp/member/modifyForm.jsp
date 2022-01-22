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

#modifyForm div {
	color: blue;
	font-size: 8px;
	font-weight: bold;
}

#modifyForm #modifyBtn, #modifyForm #resetBtn, #zipBtn {
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

#modifyBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#modifyForm #resetBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#zipBtn:hover {
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

input[type="password"] {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
}

select {
	border-radius: 5px;
	border: 1.5px #8CA6DB solid;
	height: 20px;
	margin-bottom: 6px;
}

input[type="radio"], input[type="radio"]:checked {
	appearance: none;
	margin-left: 16px;
	border: 1px solid #8CA6DB;
	border-radius: 100%;
	height: 14px;
	width: 14px;
}

input[type="radio"] {
	background-color: white;
	border: 1px solid #8CA6DB;
}

input[type="radio"]:checked {
	background-image: linear-gradient(to right, #B993D6 0%, #8CA6DB 51%, #B993D6 100%);
	background-size: 250% auto;
	border: 1px solid #8CA6DB;
}
</style>
<form name="modifyForm" id="modifyForm">
	<table cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">이름</td>
			<td><input type="text" name="name" id="name"
				value="${sessionScope.memInfo.getName()}">
				<div id="nameDiv"></div></td>
		</tr>

		<tr>
			<td width="100" align="center">아이디</td>
			<td><input type="text" name="id" id="id"
				value="${sessionScope.memInfo.getId()}" readonly></td>
		</tr>

		<tr>
			<td width="100" align="center">비밀번호</td>
			<td><input type="password" name="pwd" id="pwd" size="30"
				value="${sessionScope.memInfo.getPwd()}">
				<div id="pwdDiv"></div></td>
		</tr>

		<tr>
			<td width="100" align="center">재확인</td>
			<td><input type="password" name="repwd" id="repwd" size="30"
				value="${sessionScope.memInfo.getPwd()}">
				<div id="repwdDiv"></div></td>
		</tr>

		<tr>
			<td width="100" align="center">성별</td>
			<td><input type="radio" name="gender" value="0" id="man">남
				<input type="radio" name="gender" value="1" id="woman">여</td>
		</tr>

		<tr>
			<td width="100" align="center">이메일</td>
			<td><input type="text" name="email1"
				value="${sessionScope.memInfo.getEmail1()}"> @ <input
				type="text" name="email2" list="email2"
				placeholder="${sessionScope.memInfo.getEmail2()}"> <datalist
					id="email2">
					<option value="naver.com">naver.com
					<option value="daum.net">daum.net
					<option value="gmail.com">gmail.com
				</datalist></td>
		</tr>

		<tr>
			<td width="100" align="center">핸드폰</td>
			<td><select name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019">019</option>
			</select> - <input type="text" name="tel2" size="6" maxlength="4"
				value="${sessionScope.memInfo.getTel2()}"> - <input
				type="text" name="tel3" size="6" maxlength="4"
				value="${sessionScope.memInfo.getTel3()}"></td>
		</tr>

		<tr>
			<td width="100" align="center">주소</td>
			<td><input type="text" name="zipcode" id="zipcode" readonly
				value="${sessionScope.memInfo.getZipcode()}"> <input
				type="button" value="우편번호 검색" id="zipBtn" name="zipBtn"
				onclick="checkPost()"><br> <input type="text"
				name="addr1" id="addr1" size="60" placeholder="주소" readonly
				value="${sessionScope.memInfo.getAddr1()}"><br> <input
				type="text" name="addr2" id="addr2" size="60" placeholder="상세주소"
				value="${sessionScope.memInfo.getAddr2()}"></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="button"
				id="modifyBtn" value="회원정보수정"> <input type="reset"
				id="resetBtn" value="다시작성" onclick="location.reload();"></td>
		</tr>
	</table>
</form>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function checkPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
					}

				} else {
				}

				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("addr1").value = addr;
				document.getElementById("addr2").focus();
			}
		}).open();
	}

	function gen() {
		let genderValue = '${sessionScope.memInfo.getGender()}';
		let gender = document.getElementsByName('gender');
		if (genderValue == 0) {
			gender[0].checked = true;
			gender[1].checked = false;
		} else if (genderValue == 1) {
			gender[0].checked = false;
			gender[1].checked = true;
		}
	}

	function tel() {
		let tel1Value = '${sessionScope.memInfo.getTel1()}';
		console.log($('select[name="tel1"]'));
		if (tel1Value == '010') {
			$('select[name="tel1"]').val('010').prop("selected", true);
		} else if (tel1Value == '011') {
			$('select[name="tel1"]').val('011').prop("selected", true);
		} else if (tel1Value == '019') {
			$('select[name="tel1"]').val('019').prop("selected", true);
		}
	}
	window.onload = gen();
	window.onload = tel();

	$('#modifyForm #modifyBtn')
		.click(function() {
			$('#modifyForm #nameDiv').empty();
			$('#modifyForm #pwdDiv').empty();
			$('#modifyForm #repwdDiv').empty();

			if ($('#modifyForm #name').val() == '') {
				$('#modifyForm #nameDiv').text("이름을 입력해주세요.");
			} else if ($('#modifyForm #pwd').val() == '') {
				$('#modifyForm #pwdDiv').text("비밀번호를 입력해주세요.");
			} else if ($('#modifyForm #pwd').val() != $('#modifyForm #repwd').val()) {
				$('#modifyForm #repwdDiv').text("비밀번호가 일치하지 않습니다.");
			} else {
				$.ajax({
					type : 'post',
					url : '/miniProject2/member/modify.do',
					data : $('#modifyForm').serialize(),
					success : function() {
						alert('수정 완료! 다시 로그인 해주세요!');
						location.href = '/miniProject2/';
					},
					error : function(err) {
						alert(err);
					}
					});
				}
	});
</script>