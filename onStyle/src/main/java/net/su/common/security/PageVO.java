package net.su.common.security;

public class PageVO {
	//페이징용 변수
	private int currentPageNo = 1;//현재 페이지 번호
	private int recordCountPerPage = 10;//한 페이지당 게시되는 게시물 건 수 //
	private int pageSize = 5;//페이지 리스트에 게시되는 페이지 건 수
	private int totalRecordCount = 0;//전체 게시물 건 수
	private int totalPageCount = 0;//전체 페이지 개수
	private int firstRecordIndex = 0;//첫 페이지 인덱스 번호(글 번호) //
	private int lastRecordIndex = 0;//마지막 페이지 인덱스 번호(글 번호)
	private int firstPageNoOnPageList = 1; //페이지 리스트의 첫 페이지 번호
	private int lastPageNoOnPageList = 1;//페이지 리스트의 마지막 페이지 번호
	
	//검색
	private String searchCondition1 = "mem_id";	//검색조건1
	private String searchCondition2;			//검색조건2
	private String searchContent;				//검색내용
	private int radioValue;					//선택된 라디오박스 값 	1:전체	2:요청	3:완료
	private String oneDatepicker;				//달력 앞 칸
	private String twoDatepicker;				//달력 뒷 칸
	
	
	public String getOneDatepicker() {
		return oneDatepicker;
	}

	public void setOneDatepicker(String oneDatepicker) {
		this.oneDatepicker = oneDatepicker;
	}

	public String getTwoDatepicker() {
		return twoDatepicker;
	}

	public void setTwoDatepicker(String twoDatepicker) {
		this.twoDatepicker = twoDatepicker;
	}
	
	public String getSearchCondition1() {
		return searchCondition1;
	}

	public void setSearchCondition1(String searchCondition1) {
		this.searchCondition1 = searchCondition1;
	}

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public int getRadioValue() {
		return radioValue;
	}

	public void setRadioValue(int radioValue) {
		this.radioValue = radioValue;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		totalPageCount = ((getTotalRecordCount()-1)/getRecordCountPerPage()) + 1;
		return totalPageCount;
	}

//	public void setTotalPageCount(int totalPageCount) {
//		this.totalPageCount = totalPageCount;
//	}

	public int getFirstRecordIndex() {
		firstRecordIndex = (getCurrentPageNo() - 1) * getRecordCountPerPage();
		return firstRecordIndex;
	}

	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}
	
	// 마지막 페이지 인덱스 번호(글 번호)
	public int getLastRecordIndex() {
		lastRecordIndex = getCurrentPageNo() * getRecordCountPerPage();
		return lastRecordIndex;
	}

//	public void setLastRecordIndex(int lastRecordIndex) {
//		this.lastRecordIndex = lastRecordIndex;
//	}
	
	//페이지 리스트의 첫 페이지 번호
	public int getFirstPageNoOnPageList() {
		firstPageNoOnPageList = ((getCurrentPageNo()-1)/getPageSize())*getPageSize() + 1;
		return firstPageNoOnPageList;
	}

//	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
//		this.firstPageNoOnPageList = firstPageNoOnPageList;
//	}

	public int getLastPageNoOnPageList() {
		lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;		
		if(lastPageNoOnPageList > getTotalPageCount()){
			lastPageNoOnPageList = getTotalPageCount();
		}
		return lastPageNoOnPageList;
	}

//	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
//		this.lastPageNoOnPageList = lastPageNoOnPageList;
//	}
	
}
