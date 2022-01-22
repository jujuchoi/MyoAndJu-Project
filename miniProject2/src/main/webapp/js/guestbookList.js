$(function() {
	$.ajax({
		type: 'post',
		url: '/miniProject2/guestbook/getGuestbookList.do',
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
						align: 'center',
					}).append($('<a/>', {
						href: '#',
						text: items.subject,
						class: 'subjectA'
					}))).append($('<td/>', {
						align: 'center',
						text: items.name
					})).append($('<td/>', {
						align: 'center',
						text: items.logtime
					})).appendTo($('#guestbookTable'));					
			});//each
			
			$('.subjectA').click(function(){
				var seq = $(this).parent().prev().text();
				alert(seq);
				location.href = '/miniProject2/guestbook/guestbookView.do?seq='+seq+'&pg='+$('#pg').val();
			});
			// 페이징
			$('#guestbookPagingDIV').html(data.guestbookPaging);
		},
		error: function(err) {
			alert(err);
		}
	});
});