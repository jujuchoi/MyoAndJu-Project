<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;

#writeForm div {
	color: blue;
	font-size: 8px;
	font-weight: bold;
}

body {
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}

#writeForm #writeBtn, #writeForm #resetBtn, #zipBtn {
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

#writeForm #writeBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#writeForm #resetBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

#zipBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
}

a {
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
<form name="writeForm" id="writeForm">
	<table id="writeFormTable" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">??????</td>
			<td><input type="text" name="name" id="name" placeholder="?????? ??????">
				<div id="nameDiv"></div></td>
		</tr>

		<tr>
			<td width="100" align="center">?????????</td>
			<td><input type="text" name="id" id="id" placeholder="????????? ??????">
				<input type="hidden" name="check" id="check" value="">
				<div id="idDiv"></div></td>
		</tr>

		<tr>
			<td width="100" align="center">????????????</td>
			<td><input type="password" name="pwd" id="pwd" size="30"
				placeholder="???????????? ??????">
				<div id="pwdDiv"></div></td>
		</tr>

		<tr>
			<td width="100" align="center">?????????</td>
			<td><input type="password" name="repwd" id="repwd" size="30"
				placeholder="???????????? ??????">
				<div id="repwdDiv"></div></td>
		</tr>

		<tr>
			<td width="100" align="center">??????</td>
			<td><input type="radio" name="gender" value="0" checked>???
				<input type="radio" name="gender" value="1">???</td>
		</tr>

		<tr>
			<td width="100" align="center">?????????</td>
			<td><input type="text" name="email1"> @ <input
				type="text" name="email2" list="email2" placeholder="????????????">
				<datalist id="email2">
					<option value="naver.com">naver.com
					<option value="daum.net">daum.net
					<option value="gmail.com">gmail.com
				</datalist></td>
		</tr>

		<tr>
			<td width="100" align="center">?????????</td>
			<td><select name="tel1">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="019">019</option>
			</select> - <input type="text" name="tel2" size="6" maxlength="4"> - <input
				type="text" name="tel3" size="6" maxlength="4"></td>
		</tr>

		<tr>
			<td width="100" align="center">??????</td>
			<td><input type="text" name="zipcode" id="zipcode" readonly>
				<input type="button" value="???????????? ??????" id="zipBtn" name="zipBtn"
				onclick="checkPost()"><br> <input type="text"
				name="addr1" id="addr1" size="60" placeholder="??????" readonly><br>
				<input type="text" name="addr2" id="addr2" size="60"
				placeholder="????????????"></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="button"
				id="writeBtn" value="????????????"> <input type="reset"
				id="resetBtn" value="????????????"></td>
		</tr>
	</table>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                }
            } else {
            }

            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            document.getElementById("addr2").focus();
        }
    }).open();
}

$('#writeForm #writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#writeForm #idDiv').empty();
	$('#writeForm #pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#name').val() == ''){
		$('#nameDiv').text("????????? ??????????????????.");
	} else if($('#writeForm #id').val() == ''){
		$('#writeForm #idDiv').text("???????????? ??????????????????.");
	} else if($('#writeForm #pwd').val() == ''){
		$('#writeForm #pwdDiv').text("??????????????? ??????????????????.");
	} else if($('#writeForm #pwd').val() != $('#repwd').val()){
		$('#repwdDiv').text("??????????????? ???????????? ????????????.");
	} else {
		$.ajax({
			type: 'post',
			url: '/miniProject2/member/write.do',
			data: $('#writeForm').serialize(),
			success: function(data){
				alert('??????????????? ???????????????!');
				location.href='/miniProject2/';
			}, 
			error: function(err){
				alert(err);
			}
		});
	}
});

// ????????? ?????? ??????
$('#writeForm #id').focusout(function(){
	$('#writeForm #idDiv').empty();
	
	var sId = $('#writeForm #id').val();
	
	if(sId == "") {
		$('#writeForm #idDiv').text('???????????? ?????? ??????????????????.');
		$('#writeForm #idDiv').css('color', 'magenta');
	} else {
		$.ajax({
			type: 'post',
			url: '/miniProject/member/checkId.do',
			data: 'id='+sId,
			dataType: 'text',
			success: function(data){
				data = data.trim();
				
				if(data == 'exist'){
					$('#writeForm #idDiv').text('?????? ?????????');
					$('#writeForm #idDiv').css('color', 'magenta');
					
				} else if(data == 'non_exist'){
					$('#writeForm #idDiv').text('?????? ??????');
					$('#writeForm #idDiv').css('color', 'magenta');
					$('#check').val(sId);
				};
			},
			error: function(err){
				alert(err);
			}
		}); //ajax
	};//else
});//function
</script>