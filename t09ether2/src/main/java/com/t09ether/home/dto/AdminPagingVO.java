package com.t09ether.home.dto;

public class AdminPagingVO {
   private int nowPage = 1; // 현재 페이지
   private int onePageRecord=10; // 한 페이지에 표시할 레코드 수
   private int totalRecord; // 총 레코드 수
   private int totalPage; // 총 페이지 수
   
   private int lastPageRecord;//마지막 페이지에 남아 있는 레코드수
   
   private int onePageNumCount=5;//한 페이지 당 페이지 갯수
   private int startPageNum = 1;
   
   //검색에 필요한 변수들
   private String searchKey;
   private String searchWord;
   private String userid;
   private int on_no;
   
   @Override
   public String toString() {
      return "PagingVO [nowPage=" + nowPage + ", onePageRecord=" + onePageRecord + ", totalRecord=" + totalRecord
            + ", totalPage=" + totalPage + ", lastPageRecord=" + lastPageRecord + ", onePageNumCount="
            + onePageNumCount + ", startPageNum=" + startPageNum + ", searchKey=" + searchKey + ", searchWord="
            + searchWord + "]";
   }

	public int getOn_no() {
		return on_no;
	}
	
	public void setOn_no(int on_no) {
		this.on_no = on_no;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public int getNowPage() {
	      return nowPage;
   }
   public void setNowPage(int nowPage) {
      this.nowPage = nowPage;
      
      //출력할 페이지 시작 번호를 계산
      //((현재 페이지-1)/표시할 페이지 수)*표시할 페이수 + 1
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
      
      //총 레코드수를 이용하여 총 페이지 수를 구하기
      totalPage = (int)Math.ceil((double)totalRecord/onePageRecord);
      
      //마지막 페이지에 남아 있는 레코드 수
      lastPageRecord = onePageRecord;
      if(nowPage==totalPage) {
         if(totalRecord%onePageRecord==0){//나머지가 0일 경우 lastPageRecord = onePageRecord
            lastPageRecord = onePageRecord;
         }else {//나머지가 있을 경우 남아있는 레코드 수를 lastPageRecord
            lastPageRecord = totalRecord % onePageRecord;
         }
      }
   
   }
   public int getTotalPage() {
      return totalPage;
   }
   public void setTotalPage(int totalPage) {
      this.totalPage = totalPage;
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

   public int getStartPageNum() {
      return startPageNum;
   }

   public void setStartPageNum(int startPageNum) {
      this.startPageNum = startPageNum;
   }

   public String getSearchKey() {
      return searchKey;
   }

   public void setSearchKey(String searchKey) {
      this.searchKey = searchKey;
   }

   public String getSearchWord() {
      return searchWord;
   }

   public void setSearchWord(String searchWord) {
      this.searchWord = searchWord;
   }
}
