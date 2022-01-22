<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR:wght@100&family=Raleway:wght@200&display=swap')
	;
	#contentSpan{
		font-family: 'Raleway', 'Noto Sans KR', sans-serif;
	}
	
	#boardListBtn, #boardUpdateBtn, #boardDeleteBtn, #boardReplyBtn {
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
	
	#boardListBtn:hover, #boardUpdateBtn:hover, #boardDeleteBtn:hover, #boardReplyBtn:hover {
	background-position: right center;
	/* change the direction of the change here */
	text-decoration: none;
	}
	
	/* #tdscroll{
		height: 200px;
		overflow-y: auto;
		overflow-x:hidden;
	} */

</style>
<form id="boardViewForm">
<input type="hidden" id="pg" name="pg" value="${pg}">
<input type="hidden" id="seq" name="seq" value="${seq}">
<input type="hidden" id="pseq" name="pseq" value="${pseq}">
<table width="450"  id="boardViewTable" border="1" cellspacing="0" cellpadding="5" frame="hsides"  rules="rows">
	<tr>
		<td colspan="3"><h3><span id="subjectSpan"></span></h3></td>
	</tr>
	<tr>
		<td width="150">글 번호: <span id="seqSpan"></span></td>
		<td width="150">작성자: <span id="idSpan"></span></td>
		<td width="150">조회수: <span id="hitSpan"></span></td>
	</tr>
	<tr>
		<td colspan="3" height="200" valign="top">
			<div id="tdscroll" style="height: 200px; overflow-y:auto; overflow-x:hidden;">
				<pre style="white-space: pre-line; word-break: break-all;">
					<span id="contentSpan"></span>
				</pre>
			</div>
		</td>
	</tr>
</table>

<input type="button" value="목록" id="boardListBtn" onclick="location.href='/miniProject2/board/boardList.do?pg=${pg}'"/>
	<span id="boardViewSpan">
		<input type="button" id="boardUpdateBtn" onclick="mode(1)" value="글수정"/>
		<input type="button" id="boardDeleteBtn" onclick="mode(2)" value="글삭제"/>
	</span>
		<input type="button" id="boardReplyBtn" onclick="mode(3)" value="답글"/>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject2/board/getBoardView.do',
		data: 'seq='+$('#seq').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.span);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if(data.memId == data.id){
				$('#boardViewSpan').show();
			} else {
				$('#boardViewSpan').hide();
			}
		},
		error: function(err){
			alert(err);
		}
	});
});
</script>
<script>
function mode(num){
	if(num == 1){ // 글 수정
		document.getElementById("boardViewForm").method = 'post';
		document.getElementById("boardViewForm").action = '/miniProject2/board/boardModifyForm.do';
		document.getElementById("boardViewForm").submit();
		
	} else if(num == 2){ // 글 삭제 - seq, pg 전달~
		document.getElementById("boardViewForm").method = 'post';
		document.getElementById("boardViewForm").action = '/miniProject2/board/boardDelete.do';
		document.getElementById("boardViewForm").submit();
	} else if(num == 3){
		// seq, pg 필요
		// 답글은 원글의 seq, pg를 사용할 것임
		document.getElementById("boardViewForm").method = 'post';
		document.getElementById("boardViewForm").action = '/miniProject2/board/boardReplyWriteFrom.do';
		document.getElementById("boardViewForm").submit();
	}
}

</script>