<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
img{
  width: 80px;
  height: 80px;
  object-fit: cover;
}
#currentPaging{
font-size: 20px;
margin: 4px;
	color: red;
	cursor: pointer;
	text-decoration: underline;
}
#paging{
font-size: 20px;
margin: 4px;
	color: black;
	cursor: pointer;
	text-decoration: none;
}

#iamgeDeleteBtn{
		font-family: 'Noto Sans KR', 'Raleway', sans-serif;
		margin: 7px 15px;
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

#iamgeDeleteBtn:hover{
	background-position: right center;
	text-decoration: none;
}

.subjectA:link{
      color: white;
      text-decoration:none;
}

.subjectA:visited{
      color: white;
      text-decoration:none;
}

.subjectA:hover{
      color: green;
      text-decoration:underline;
}

.subjectA:active{
      color: cyan;
      text-decoration:none;
}

</style>
<form name="imageboardList" action="/miniProject2/imageboard/imageboardDelete.do">
<input type="hidden" id="pg" value="${pg}">
<input type="hidden" id="memId" value="${memId}">
<table id="imageboardListTable" border="0.5" cellspacing="0" cellpadding="5" 
											 frame="hsides"  rules="rows">
	<tr>
		<th width="100">
		<input type="checkbox" id="all" onclick="checkAll()">
		번호</th>
		<th width="400">이미지</th>
		<th width="200">상품명</th>
		<th width="100">단가</th>
		<th width="100">개수</th>
		<th width="100">합계</th>
	</tr>	
	<c:if test="${list != null}">
		<c:forEach var="imageboardDTO" items="${list}">
			<tr>
				<td align="center">
				<input type="checkbox" name="check" value="${imageboardDTO.seq}" class="check">
				${imageboardDTO.seq}</td>
				<td align="center"><img src="/miniProject2/storage/${imageboardDTO.image1}" alt="${imageboardDTO.imageName}"></td>
				<td align="center"><a href="/miniProject2/imageboard/imageboardView.do?seq=${imageboardDTO.seq}&pg=${pg}" class="imageNameA">${imageboardDTO.imageName}</a></td>
				<td align="center">
				<fmt:formatNumber pattern="#,###">${imageboardDTO.imagePrice}</fmt:formatNumber>
				</td>
				<td align="center">${imageboardDTO.imageQty}</td>
				<td align="center">
				<fmt:formatNumber pattern="#,###">${imageboardDTO.imagePrice * imageboardDTO.imageQty}</fmt:formatNumber>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	
</table>
<input type="button" value="선택삭제" id="iamgeDeleteBtn" style="float: left;" onclick="imageDelete()">
<div id="imageboardPagingDIV" style="text-align: center" style="float: left;">${imageboardPaging}</div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	function imageboardPaging(pg2){
		location.href="/miniProject2/imageboard/imageboardList.do?pg="+pg2;
	}
	
	function checkAll(){
		/* const checkboxes = document.getElementsByClassName('input[type="checkbox"]');
		
		checkboxes.forEach(() => {
			checkbox.checked = checkAll.checked;
		}); */
		//alert("체크 박스 개수 ="+ document.getElementsByName('check').length);
		//alert("글번호 체크 여부 ="+document.getElementById('all').checked) // true or false
		
		var check = document.getElementsByName("check");
		if(document.getElementById("all").checked){
			for(i = 0; i < check.length; i++){
				check[i].checked = true;
			}
		} else {
			for(i = 0; i < check.length; i++){
				check[i].checked = false;
			}
		}
			
		/* if(document.getElementById('all').checked==true){ -> 이렇게 하지 마슈! 이미 document.getElementById('all').checked 자체가 조건임
			for(let i = 0; i < 3; i++){
				document.getElementsByName('check')[i].check=true;
			}
		} else if(document.getElementById('all').checked==false){
			for(let i = 0; i < 3; i++){
				document.getElementsByName('check')[i].check=false;
			}
		} */
	};
	
	/* function imageDelete(){
		var check = document.getElementsByName("check");
		var list = [];
		for(i = 0; i < check.length; i++){
			if(check[i].checked){
				//console.log(check[i]);
				list.push(check[i].value)
			}
		}
		var urls
		for(i = 0; i < list.length; i++){
			if(i != list.length - 1){
				urls += list[i] + '&check='; 
			} else {
				urls += list[i]
			}
		}
		location.href="/miniProject2/imageboard/imageboardDelete.do?check="+urls;
		
	} */

</script>