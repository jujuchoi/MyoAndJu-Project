<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<style>
#currentPaging{
	font-size: 20px;
	margin: 4px;
	color: red;
		cursor: pointer;
	text-decoration: underline;
}
#paging{
	font-size: 20px;
		color: black;
	margin: 4px;
		cursor: pointer;
	text-decoration: none;
}

</style>
<form name="guestbookList">
<input type="hidden" id="pg" name="pg" value="${pg}">

<table id="guestbookTable" cellspacing="0" cellpadding="11" frame="hsides"  rules="rows">
	<tr>
		<th width="100">방명록번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
	</tr>
</table>
<div id="guestbookPagingDIV" style="text-align:center;"></div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/miniProject2/js/guestbookList.js"></script>
<script>
	function guestbookPaging(pg2){
		location.href="/miniProject2/guestbook/guestbookList.do?pg="+pg2;
	}
</script>