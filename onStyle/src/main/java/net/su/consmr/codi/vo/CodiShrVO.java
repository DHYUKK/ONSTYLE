package net.su.consmr.codi.vo;

public class CodiShrVO {
	
	private int pageCode;				//1:나의 코디, 2:답변받은 코디 or 코디요청, 3:스크랩 코디, 4:코디공유게시판
	private int sortType;            	//정렬 타입
	private int selectRecordCount;		//더 보기 개수
	private int currentPageNo;			//현재 페이지 번호

	private int codi_seq;				//코디tb seq
	private String codi_img_route;		//코디tb 이미지 경로
	private int mem_seq;				//회원 seq
	
	private int codi_shr_seq;			//코디 공유 seq
	private String codi_shr_regtime;	//코디 공유 등록날짜
	
	private int codi_reqst_seq;			//코디 요청 seq
	private String codi_reqst_state;	//코디 요청 상태
	private String codi_reqst_contnt;	//코디 요청 내용
	
	private int codi_answr_seq;			//코디 답변 
	private String answr_contnt;		//코디 답변 내용
	
	private int scrap_codi_seq;			//스크랩 코디 seq

	private String codi_shr_order;		//정렬 순서
	
	private int like_seq;				//좋아요 seq
	private int reply;					//댓글 수 
	private int liked;					//좋아요 수 
	private String mem_name;			//회원 이름 
	private String mem_nicknme;			//회원 닉네임
	private String mem_img_route;		//회원 프로필 사진
	
	private int codi_reply_seq;			//댓글 seq
	private String codi_reply_contnt;	//댓글 내용
	private int reply_view;			//댓글 페이징
	
	private int likeState;				//좋아요 상태 여부
	private int scrapState;				//스크랩 상태 여부 
	
	private int prodct_seq;				//상품 seq
	private String prodct_nme;			//상품 명
	private String prodct_img_route1;	//코디 사용 옷 상품 이미지 경로
	private int prodct_price;			//상품 가격

	private int today;			//오늘날짜
	
	
	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getToday() {
		return today;
	}
	
	public void setToday(int today) {
		this.today = today;
	}

	public int getReply_view() {
		return reply_view;
	}
	
	public void setReply_view(int reply_view) {
		this.reply_view = reply_view;
	}

	public int getProdct_price() {
		  return prodct_price;
		}

	public void setProdct_price(int prodct_price) {
		this.prodct_price = prodct_price;
	}

	public int getProdct_seq() {
		return prodct_seq;
	}

	public void setProdct_seq(int prodct_seq) {
		this.prodct_seq = prodct_seq;
	}

	public String getProdct_nme() {
		return prodct_nme;
	}

	public void setProdct_nme(String prodct_nme) {
		this.prodct_nme = prodct_nme;
	}

	public String getProdct_img_route1() {
		return prodct_img_route1;
	}

	public void setProdct_img_route1(String prodct_img_route1) {
		this.prodct_img_route1 = prodct_img_route1;
	}
	
	public int getCodi_reply_seq() {
		return codi_reply_seq;
	}

	public void setCodi_reply_seq(int codi_reply_seq) {
		this.codi_reply_seq = codi_reply_seq;
	}

	public String getMem_nicknme() {
		return mem_nicknme;
	}

	public void setMem_nicknme(String mem_nicknme) {
		this.mem_nicknme = mem_nicknme;
	}

	public String getCodi_reply_contnt() {
		return codi_reply_contnt;
	}

	public void setCodi_reply_contnt(String codi_reply_contnt) {
		this.codi_reply_contnt = codi_reply_contnt;
	}
	
	public int getScrapState() {
		return scrapState;
	}

	public void setScrapState(int scrapState) {
		this.scrapState = scrapState;
	}

	public int getLikeState() {
		return likeState;
	}

	public void setLikeState(int likeState) {
		this.likeState = likeState;
	}

	public int getLike_seq() {
		return like_seq;
	}

	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}
	
	public String getMem_img_route() {
		return mem_img_route;
	}

	public void setMem_img_route(String mem_img_route) {
		this.mem_img_route = mem_img_route;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}
	
	public String getCodi_shr_order() {
		return codi_shr_order;
	}

	public void setCodi_shr_order(String codi_shr_order) {
		this.codi_shr_order = codi_shr_order;
	}

	public int getCodi_seq() {
		return codi_seq;
	}

	public void setCodi_seq(int codi_seq) {
		this.codi_seq = codi_seq;
	}

	public String getCodi_img_route() {
		return codi_img_route;
	}

	public void setCodi_img_route(String codi_img_route) {
		this.codi_img_route = codi_img_route;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public int getCodi_shr_seq() {
		return codi_shr_seq;
	}

	public void setCodi_shr_seq(int codi_shr_seq) {
		this.codi_shr_seq = codi_shr_seq;
	}

	public String getCodi_shr_regtime() {
		return codi_shr_regtime;
	}

	public void setCodi_shr_regtime(String codi_shr_regtime) {
		this.codi_shr_regtime = codi_shr_regtime;
	}

	public int getCodi_reqst_seq() {
		return codi_reqst_seq;
	}

	public void setCodi_reqst_seq(int codi_reqst_seq) {
		this.codi_reqst_seq = codi_reqst_seq;
	}

	public String getCodi_reqst_state() {
		return codi_reqst_state;
	}

	public void setCodi_reqst_state(String codi_reqst_state) {
		this.codi_reqst_state = codi_reqst_state;
	}

	public String getCodi_reqst_contnt() {
		return codi_reqst_contnt;
	}

	public void setCodi_reqst_contnt(String codi_reqst_contnt) {
		this.codi_reqst_contnt = codi_reqst_contnt;
	}

	public int getCodi_answr_seq() {
		return codi_answr_seq;
	}

	public void setCodi_answr_seq(int codi_answr_seq) {
		this.codi_answr_seq = codi_answr_seq;
	}

	public String getAnswr_contnt() {
		return answr_contnt;
	}

	public void setAnswr_contnt(String answr_contnt) {
		this.answr_contnt = answr_contnt;
	}

	public int getScrap_codi_seq() {
		return scrap_codi_seq;
	}

	public void setScrap_codi_seq(int scrap_codi_seq) {
		this.scrap_codi_seq = scrap_codi_seq;
	}

	public int getPageCode() {
		return pageCode;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public int getSortType() {
		return sortType;
	}

	public void setSortType(int sortType) {
		this.sortType = sortType;
	}

	public int getSelectRecordCount() {
		return selectRecordCount;
	}

	public void setSelectRecordCount(int selectRecordCount) {
		this.selectRecordCount = selectRecordCount;
	}
	
}