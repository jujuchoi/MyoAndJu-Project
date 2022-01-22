<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;
.subjectA:link{text-decoration: none;} 
.subjectA:visited{text-decoration: none;}
.subjectA:hover{text-decoration: underline;}
.subjectA:active{text-decoration: none;}

#boardPagingDIV{
	margin: 0 5px;
	padding: 2px;
	font-size: 13pt;
}

#boardPagingDIV span{
	margin: 1px 5px;
	padding: 2px;
}

#currentPaging{
	color: red;
	cursor: pointer;
}

#paging{
	colot: black;
	cursor: pointer;
	font-family: 'Raleway', 'Noto Sans KR', sans-serif;
}
</style>
<input type="hidden" id="pg" value="${pg}">
<input type="hidden" id="memId" value="${memId}">
<table id="boardListTable" border="0.5" cellspacing="0" cellpadding="5" frame="hsides"  rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">작성일</th>
		<th width="100">조회수</th>
	</tr>
</table>
<div id="boardPagingDIV" style="text-align: center;">
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/miniProject2/js/boardList.js"></script>
<script>
	function boardPaging(pg2){
		location.href='/miniProject2/board/boardList.do?pg='+pg2;
	}
</script>