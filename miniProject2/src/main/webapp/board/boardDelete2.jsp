<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
// jquery 처리
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject2/board/getBoardDelete.do',
		data: 'seq=${seq}',
		// jsp라서 바로 받아올 수 있음. hidden type으로 받아온 후 적어도 됨
		// script 밖에서 <input type="hidden" name="seq" id="seq" value="${seq}>
		// data: 'seq='+$('#seq').val()
		success: function(){
			alert('글 삭제 완료');
			location.href='/miniProject2/board/boardList.do?pg=1';
		},
		error: function(err){
			alert(err);
		}
	});
});
</script>