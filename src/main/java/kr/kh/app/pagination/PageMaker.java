package kr.kh.app.pagination;

import lombok.Data;

@Data
public class PageMaker {
	
	private int totalCount; // 전체 건텐츠 개수
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum;
	private Criteria cri;

	
	
	//totalCount, displayPageNum, perPageNum(cri)
	public void calculate() {
		//현재 페이지에 대한 최대 페이지 번호
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPage = endPage - displayPageNum + 1;
		//컨텐츠 개수를 이용하여 계산한 최대 페이지 번호
		int tmpEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		//endPage와 tmpEndPage 중 작은 값을 endPage로 설정
 		if(endPage> tmpEndPage) {
			endPage = tmpEndPage;
		}
 		//첫번째 페이지네이션이면 false 아니면 true
 		prev = startPage == 1 ? false : true;
 		//마지막 페이지네이션이면 false 아니면 true
 		next = endPage == tmpEndPage ? false : true;
 	
	}
	
	public PageMaker(int displayPageNum, Criteria cri, int totalCount) {
		this.displayPageNum = displayPageNum;
		this.cri = cri;
		this.totalCount = totalCount;
		calculate();
	}
}
