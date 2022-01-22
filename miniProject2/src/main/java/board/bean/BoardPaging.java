package board.bean;

import lombok.Data;

@Data
public class BoardPaging {
	private int currentPage;
	private int pageBlock; // [1][2][3] [다음] -> [4][5][6] [다음]
	private int pageSize; // 한 페이지 당 글 몇 개씩 보여줄거야~? -> 한 페이지 당 5개
	private int totalA; // 총 글 수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA + pageSize - 1) / pageSize; // 촐 페이지 수
		
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > totalP) {
			endPage = totalP;
		}
		
		if(startPage > pageBlock) {
			pagingHTML.append("<span id=paging onclick=boardPaging(" + ( startPage - 1 ) + ")>이전</span>");
		} // if
		
		for(int i = startPage; i <= endPage; i++) {
			if(i == currentPage) {
				pagingHTML.append("<span id=currentPaging onclick=boardPaging(" + ( i ) + ")>"+i+"</span>");
			} else {
				pagingHTML.append("<span id=paging onclick=boardPaging(" + ( i ) + ")>"+i+"</span>");
			}
		} // for
		
		if(endPage < totalP) {
			pagingHTML.append("<span id=paging onclick=boardPaging(" + ( endPage + 1 ) + ")>다음</span>");
		} // if
	}

}
