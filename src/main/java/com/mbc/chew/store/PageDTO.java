package com.mbc.chew.store;

public class PageDTO {
	//현재 페이지, 시작 페이지, 끝 페이지, 전체 레코드수, 한 페이지에 나타낼 레코드수, 전체 페이지, 쿼리에 쓰일 start,end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage=5; //한번에 나타낼 페이지 수
	public int getCntPage() { return cntPage; }
	public void setCntPage(int cntPage) {
		this.cntPage=cntPage;
	}
	
	public PageDTO() {}
	public PageDTO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(),getCntPerPage());
	}
	
	//전체 페이지 수
	private void calcLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total/(double)cntPerPage));
	}
	
	//시작페이지와 끝페이지
	private void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage/(double)cntPage))*cntPage);
		setStartPage(getEndPage()-cntPage+1);
		
		if(getLastPage()<getEndPage()) {
			setEndPage(getLastPage());
		}
		
		if(getStartPage()<1) {
			setStartPage(1);
		}
	}
	
	//DB쿼리에 정의할 start,end
	private void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage*cntPerPage);
		setStart(getEnd()-cntPerPage+1);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

}
