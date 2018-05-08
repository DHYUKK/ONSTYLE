package net.su.admin.codi.vo;

import java.util.List;

import net.su.common.security.PageVO;

public class AdminCodiReqstVO extends PageVO{
	//코디요청관련
	private int codi_reqst_seq;					//코디요청 seq
	private int codi_seq;						//요청코디 seq
	private int reqstCodi_seq;					//코디seq
	private String codi_reqst_date;				//코디요청 날짜
	private String codi_reqst_state;			//요청 상태		y or n
	private String codi_reqst_contnt;			//요청멘트
	private String reqst_codi_img_route;		//요청코디 이미지 경로
	
	//코디답변관련
	private int codi_answr_seq;					//답변 seq
	private String answr_codi_img_route;		//요청코디 이미지 경로
	private String answr_contnt;				//답변코디 멘트
	private int answrCodi_seq;					//답변코디 seq
	private int codi_type;						//답변받은 코디 저장여부		2: 저장, else 저장 안함

	//회원관련
	private int mem_seq;						//회원 seq
	private String mem_id;						//회원 id
	private String mem_name;					//회원 이름
	private String mem_nicknme;					//회원 닉네임
	private String mem_img_route;				//회원 닉네임

	private List<Integer> reqstCheckGroup;		//선택한 코디요청 삭제
	private int location;						/*페이지 위치  0 : 전체 조회에서 삭제 후, 리스트만 조회
	 													 1 : 상세조회에서 삭제 후 , 전체 조회*/
	private String readPageNme;					//어떤 상세보기 페이지에서 수정화면으로 가는지			수정을 한개 메서드를 이용해서 모두 하기 떄문에 경로를 밝혀야함!

	
	public String getReadPageNme() {
		return readPageNme;
	}
	public void setReadPageNme(String readPageNme) {
		this.readPageNme = readPageNme;
	}
	public int getCodi_type() {
		return codi_type;
	}
	public void setCodi_type(int codi_type) {
		this.codi_type = codi_type;
	}
	public List<Integer> getReqstCheckGroup() {
		return reqstCheckGroup;
	}
	public int getCodi_answr_seq() {
		return codi_answr_seq;
	}
	public void setCodi_answr_seq(int codi_answr_seq) {
		this.codi_answr_seq = codi_answr_seq;
	}
	public String getAnswr_codi_img_route() {
		return answr_codi_img_route;
	}
	public void setAnswr_codi_img_route(String answr_codi_img_route) {
		this.answr_codi_img_route = answr_codi_img_route;
	}
	public String getAnswr_contnt() {
		return answr_contnt;
	}
	public void setAnswr_contnt(String answr_contnt) {
		this.answr_contnt = answr_contnt;
	}
	public int getAnswrCodi_seq() {
		return answrCodi_seq;
	}
	public void setAnswrCodi_seq(int answrCodi_seq) {
		this.answrCodi_seq = answrCodi_seq;
	}
	public int getReqstCodi_seq() {
		return reqstCodi_seq;
	}
	public void setReqstCodi_seq(int reqstCodi_seq) {
		this.reqstCodi_seq = reqstCodi_seq;
	}
	public String getReqst_codi_img_route() {
		return reqst_codi_img_route;
	}
	public void setReqst_codi_img_route(String reqst_codi_img_route) {
		this.reqst_codi_img_route = reqst_codi_img_route;
	}
	public String getCodi_reqst_contnt() {
		return codi_reqst_contnt;
	}
	public void setCodi_reqst_contnt(String codi_reqst_contnt) {
		this.codi_reqst_contnt = codi_reqst_contnt;
	}
	public String getMem_img_route() {
		return mem_img_route;
	}
	public void setMem_img_route(String mem_img_route) {
		this.mem_img_route = mem_img_route;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public void setReqstCheckGroup(List<Integer> reqstCheckGroup) {
		this.reqstCheckGroup = reqstCheckGroup;
	}
	public int getCodi_reqst_seq() {
		return codi_reqst_seq;
	}
	public void setCodi_reqst_seq(int codi_reqst_seq) {
		this.codi_reqst_seq = codi_reqst_seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nicknme() {
		return mem_nicknme;
	}
	public void setMem_nicknme(String mem_nicknme) {
		this.mem_nicknme = mem_nicknme;
	}
	public int getCodi_seq() {
		return codi_seq;
	}
	public void setCodi_seq(int codi_seq) {
		this.codi_seq = codi_seq;
	}
	public String getCodi_reqst_date() {
		return codi_reqst_date;
	}
	public void setCodi_reqst_date(String codi_reqst_date) {
		this.codi_reqst_date = codi_reqst_date;
	}
	public String getCodi_reqst_state() {
		return codi_reqst_state;
	}
	public void setCodi_reqst_state(String codi_reqst_state) {
		this.codi_reqst_state = codi_reqst_state;
	}
}
