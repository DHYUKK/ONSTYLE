package net.su.consmr.codi.vo;

import java.util.List;

import net.su.common.security.PageVO;

public class MyDressRoomVO extends PageVO{
	//가상코디
	private int admin;									//관리자 여부	0 or 1 
	private int pageCode;            					//1:나의 코디, 2:답변받은 코디 or 코디요청, 3:스크랩 코디, 4:코디공유게시판
	private Integer myCloth_seq=null;         			//나의 옷 seq
	private String myCloth_img_route;   				//나의 옷 이미지 경로
	private String backgrndRemove_src;					//배경제거 할 이미지 경로
	private int mem_seq;            					//회원 seq
	private int category_seq;
	private String category_nme;      					//카테고리 이름
	private String bigGroup;         					//나의 옷 or 미스봄 상품 카테고리
	   
	private List<String> canvas_img_seq = null; 		// 코디에 사용된 옷 분류+seq   ex)m2 -> 나의 옷 중 seq가 2
	private List<String> xpoint_list = null; 			// 코디에 사용된 옷 x좌표 리스트
	private List<String> ypoint_list = null; 			// 코디에 사용된 옷 y좌표 리스트
	private List<String> width_list = null; 			// 코디에 사용된 옷 크기 리스트
	
	private String readPageNme;							//어떤 상세보기 페이지에서 수정화면으로 가는지	myCodi:나의코디 상세보기에서 수정화면으로,	reqst:코디요청 상세보기에서 수정화면으로 
	private String codi_use_xpoint;      				//코디에 사용된 옷 x좌표
	private String codi_use_ypoint;         			//코디에 사용된 옷 y좌표
	private String codi_use_width;      				//코디에 사용된 옷 크기
	private int codi_use_sort;      					//옷 순서
	private int codiSaveType;							//코디저장타입 			0:코디 요청시 선택한 옷, 1:내가 직접 만든 코디 , 2:답변받은 코디를 저장한 경우, 3:내가 만든 코디 수정
	private String codi_use_img;						//코디에 사용된 옷 이미지 경로
	private String id_code;								//옷의 code   			ex)m2 -> 나의 옷 중 seq가 2
	private int codi_seq;            					//코디seq
	private String codi_img_route;      				//코디 이미지 경로
	private String mem_nicknme;         				//회원 닉네임
	private String mem_img_route;      					//회원 이미지
   
	private String codi_shr_seq;      					//코디공유게시판seq
	private int liked;               					//좋아요 개수
	private int reply;                  				//댓글 수 
	private int likeState; 								//좋아요 상태 여부
	
	private List<Integer> selectedCodiSeq = null; 		// 코디조회 체크 그룹
	   
	private int sortType;            					//정렬 타입
	
	private int location;            					/*페이지 위치  1 : 삭제 후 , 나의 옷장 조회
																 2 : 삭제 후 , 오늘 나 어때? 조회 */
	
	private int selectRecordCount=6;					//더 보기 개수
//	private int totalRecordCount;						//전체 게시물 건 수
																 
	   
	/*:::prodct 관련 변수:::*/
	private Integer prodct_seq = null;
	private String prodct_nme;
	private String prodct_price;
	private String transparent_img_route;
	
	/*:::prodct APP 변수:::*/
	private String selected_clothes_src;
	
	
	
	//정우추가
	private String codi_shr_regtime = "";
	private String mem_name ="";
	private int scrapState = 0;
	private int codi_type = 0;
	
	
	public int getCodi_type() {
		return codi_type;
	}
	public void setCodi_type(int codi_type) {
		this.codi_type = codi_type;
	}
	public int getScrapState() {
		return scrapState;
	}
	public void setScrapState(int scrapState) {
		this.scrapState = scrapState;
	}
	public String getCodi_shr_regtime() {
		return codi_shr_regtime;
	}
	public void setCodi_shr_regtime(String codi_shr_regtime) {
		this.codi_shr_regtime = codi_shr_regtime;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getSelected_clothes_src() {
		return selected_clothes_src;
	}
	public void setSelected_clothes_src(String selected_clothes_src) {
		this.selected_clothes_src = selected_clothes_src;
	}
	public String getBackgrndRemove_src() {
		return backgrndRemove_src;
	}
	public void setBackgrndRemove_src(String backgrndRemove_src) {
		this.backgrndRemove_src = backgrndRemove_src;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getReadPageNme() {
		return readPageNme;
	}
	public void setReadPageNme(String readPageNme) {
		this.readPageNme = readPageNme;
	}
	public int getSelectRecordCount() {
		return selectRecordCount;
	}
	public void setSelectRecordCount(int selectRecordCount) {
		this.selectRecordCount = selectRecordCount;
	}
	public int getCodiSaveType() {
		return codiSaveType;
	}
	public void setCodiSaveType(int codiSaveType) {
		this.codiSaveType = codiSaveType;
	}
	public int getPageCode() {
		return pageCode;
	}
	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}
	public int getLikeState() {
		return likeState;
	}
	public void setLikeState(int likeState) {
		this.likeState = likeState;
	}
	public String getId_code() {
		return id_code;
	}
	public void setId_code(String id_code) {
		this.id_code = id_code;
	}
	public String getCodi_use_img() {
		return codi_use_img;
	}
	public void setCodi_use_img(String codi_use_img) {
		this.codi_use_img = codi_use_img;
	}
	public Integer getMyCloth_seq() {
		return myCloth_seq;
	}
	public void setMyCloth_seq(Integer myCloth_seq) {
		this.myCloth_seq = myCloth_seq;
	}
	public String getMyCloth_img_route() {
		return myCloth_img_route;
	}
	public void setMyCloth_img_route(String myCloth_img_route) {
		this.myCloth_img_route = myCloth_img_route;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public int getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(int category_seq) {
		this.category_seq = category_seq;
	}
	public String getCategory_nme() {
		return category_nme;
	}
	public void setCategory_nme(String category_nme) {
		this.category_nme = category_nme;
	}
	public String getBigGroup() {
		return bigGroup;
	}
	public void setBigGroup(String bigGroup) {
		this.bigGroup = bigGroup;
	}
	public List<String> getCanvas_img_seq() {
		return canvas_img_seq;
	}
	public void setCanvas_img_seq(List<String> canvas_img_seq) {
		this.canvas_img_seq = canvas_img_seq;
	}
	public List<String> getXpoint_list() {
		return xpoint_list;
	}
	public void setXpoint_list(List<String> xpoint_list) {
		this.xpoint_list = xpoint_list;
	}
	public List<String> getYpoint_list() {
		return ypoint_list;
	}
	public void setYpoint_list(List<String> ypoint_list) {
		this.ypoint_list = ypoint_list;
	}
	public List<String> getWidth_list() {
		return width_list;
	}
	public void setWidth_list(List<String> width_list) {
		this.width_list = width_list;
	}
	public String getCodi_use_xpoint() {
		return codi_use_xpoint;
	}
	public void setCodi_use_xpoint(String codi_use_xpoint) {
		this.codi_use_xpoint = codi_use_xpoint;
	}
	public String getCodi_use_ypoint() {
		return codi_use_ypoint;
	}
	public void setCodi_use_ypoint(String codi_use_ypoint) {
		this.codi_use_ypoint = codi_use_ypoint;
	}
	public String getCodi_use_width() {
		return codi_use_width;
	}
	public void setCodi_use_width(String codi_use_width) {
		this.codi_use_width = codi_use_width;
	}
	public int getCodi_use_sort() {
		return codi_use_sort;
	}
	public void setCodi_use_sort(int codi_use_sort) {
		this.codi_use_sort = codi_use_sort;
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
	public String getMem_nicknme() {
		return mem_nicknme;
	}
	public void setMem_nicknme(String mem_nicknme) {
		this.mem_nicknme = mem_nicknme;
	}
	public String getMem_img_route() {
		return mem_img_route;
	}
	public void setMem_img_route(String mem_img_route) {
		this.mem_img_route = mem_img_route;
	}
	public String getCodi_shr_seq() {
		return codi_shr_seq;
	}
	public void setCodi_shr_seq(String codi_shr_seq) {
		this.codi_shr_seq = codi_shr_seq;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public List<Integer> getSelectedCodiSeq() {
		return selectedCodiSeq;
	}
	public void setSelectedCodiSeq(List<Integer> selectedCodiSeq) {
		this.selectedCodiSeq = selectedCodiSeq;
	}
	public int getSortType() {
		return sortType;
	}
	public void setSortType(int sortType) {
		this.sortType = sortType;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public Integer getProdct_seq() {
		return prodct_seq;
	}
	public void setProdct_seq(Integer prodct_seq) {
		this.prodct_seq = prodct_seq;
	}
	public String getProdct_nme() {
		return prodct_nme;
	}
	public void setProdct_nme(String prodct_nme) {
		this.prodct_nme = prodct_nme;
	}
	public String getProdct_price() {
		return prodct_price;
	}
	public void setProdct_price(String prodct_price) {
		this.prodct_price = prodct_price;
	}
	public String getTransparent_img_route() {
		return transparent_img_route;
	}
	public void setTransparent_img_route(String transparent_img_route) {
		this.transparent_img_route = transparent_img_route;
	}

	
}