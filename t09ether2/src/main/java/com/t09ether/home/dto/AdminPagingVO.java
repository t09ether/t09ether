package com.t09ether.home.dto;

public class AdminPagingVO {

	private int nowPage = 1; // 현재 페이지
	private int onePageRecord=5; // 한 페이지에 표시할 레코드 수
	private int onePageNumCount=5;//한 페이지 당 페이지 갯수
	
  //검색에 필요한 변수들
   private String searchKey;
   private String searchWord;
   private String userid;
   private int on_no;
	
	/*
	 * public int getOffset() { 
	 * return (nowPage - 1) * onePageRecord; 
	 * }
	 */
	
	private int totalRecord; // 총 레코드 수
	private int totalPage; // 총 페이지 수
	private int startPageNum = 1;
	
	private int endPageNum;//끝페이지번호 endPage
   private int limitStart;           // LIMIT 시작 위치 
   private boolean existPrevPage;    // 이전 페이지 존재 여부
   private boolean existNextPage;    // 다음 페이지 존재 여부
	
   
	private int lastPageRecord;//마지막 페이지에 남아 있는 레코드수


	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		//출력할 페이지 시작번호를 계산
		//((현재페이지-1)/표시할 페이지수)*표시할페이지수+1
		startPageNum = ((nowPage-1)/onePageNumCount)*onePageNumCount+1;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//총레코드수를 이용하여 총페이지 수를 구하기
		totalPage = (int)Math.ceil((double)totalRecord/onePageRecord);
		
		//마지막페이지에 남아 있는 레코드 수
		lastPageRecord = onePageRecord;
		if(nowPage==totalPage) {
			if(totalRecord%onePageRecord==0){//나머지가 0일 경우는 lastPageRecord <- onePageRecord
				lastPageRecord = onePageRecord;
			}else{//나머지가 있을 경우 남아있는 레코드수를 lastPageRecord
				lastPageRecord = totalRecord%onePageRecord;
			}
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
		
		endPageNum = startPageNum + onePageNumCount - 1;
		if (endPageNum > totalRecord) {
           endPageNum = totalRecord;
       }
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
		limitStart = (nowPage - 1) * onePageRecord;
	}

	public boolean isExistPrevPage() {
		return existPrevPage;
	}

	public void setExistPrevPage(boolean existPrevPage) {
		this.existPrevPage = existPrevPage;
		existPrevPage = startPageNum != 1;
	}

	public boolean isExistNextPage() {
		return existNextPage;
	}

	public void setExistNextPage(boolean existNextPage) {
		this.existNextPage = existNextPage;
		 existNextPage = (endPageNum * onePageRecord) < totalRecord;
	}

	public int getLastPageRecord() {
		return lastPageRecord;
	}

	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
	
	
	public int getOnePageNumCount() {
		return onePageNumCount;
	}

	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getOn_no() {
		return on_no;
	}

	public void setOn_no(int on_no) {
		this.on_no = on_no;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

}
