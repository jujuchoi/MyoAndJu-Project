$(function() {
	$.ajax({
		type: 'post',
		url: '/miniProject2/board/getBoardList.do',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data) {
			//alert(JSON.stringify(data));
			//alert(data.list[0].seq);

			$.each(data.list, function(index, items) {
				// DOM
				$('<tr/>')
					.append($('<td/>', {
						align: 'center',
						text: items.seq
					})).append($('<td/>', {
					}).append($('<a/>', {
						href: '#',
						text: items.subject,
						class: 'subjectA subjectA_'+items.seq
					}))).append($('<td/>', {
						align: 'center',
						text: items.id
					})).append($('<td/>', {
						align: 'center',
						text: items.logtime
					})).append($('<td/>', {
						align: 'center',
						text: items.hit
					})).appendTo($('#boardListTable'));
					
					// 답글
					for(j=0; j<items.lev; j++){
						$('.subjectA_'+items.seq).before('&emsp;');
					}
					
					if(items.pseq != 0){ // or items.lev != 0
						$('.subjectA_'+items.seq).before($('<img/>', {
							src:'../image/reply.gif'
						}));
					}
						
			});//each
			
			// 로그인 여부
			$('.subjectA').click(function() {
				//alert(data.memId);
				//alert(this.tagName); //A
				//alert($(this).parent().prev().text()); // seq 가져온다
				var seq = $(this).parent().prev().text();
				if (data.memId == null) { // 세션이 null이면 로그인 안 한 상태니까 로그인하라고 알람주기
					alert('로그인 후 확인 가능');
					return false;
				} else {
					location.href = '/miniProject2/board/boardView.do?seq=' + seq + '&pg=' + $('#pg').val();
					// 주소 맞는 지 확인 필요
				};
			});
			
			// 페이징
			$('#boardPagingDIV').html(data.boardPaging);
			
			
		},
		error: function(err) {
			alert(err);
		}
	});
});