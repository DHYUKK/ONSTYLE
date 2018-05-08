package net.su.consmr.codi.vo;

import java.util.List;

import net.su.common.security.PageVO;

public class CodiReqstVO extends PageVO{
	private int codi_reqst_seq;					//코디요청seq
	private String codi_reqst_state;			//코디요청 상태  n:요청	y:답변완료
	private String codi_reqst_contnt;			//요청멘트
	private String codi_reqst_date;				//요청날짜
	private int reqstCodi_seq;					//코디seq
	private String reqst_codi_img_route;		//요청코디 이미지 경로
	
	private int codi_answr_seq;					//답변 seq
	private String answr_codi_img_route;		//요청코디 이미지 경로
	private String answr_contnt;				//답변코디 멘트
	private int answrCodi_seq;					//답변코디 seq
	private List<Integer> reqstCheckGroup;		//선택한 코디요청 삭제
	
	private int mem_seq;						//회원seq
	private String mem_img_route;				//회원 이미지 경로
	private String mem_nicknme;					//회원 닉네임
	
	private int location;						/*페이지 위치  0 : 전체 조회에서 삭제 후, 리스트만 조회
														 1 : 상세조회에서 삭제 후 , 전체 조회
														 2 : 관리자 페이지에서 코디요청 삭제후 전체 조회*/

	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public List<Integer> getReqstCheckGroup() {
		return reqstCheckGroup;
	}
	public void setReqstCheckGroup(List<Integer> reqstCheckGroup) {
		this.reqstCheckGroup = reqstCheckGroup;
	}
	public String getMem_img_route() {
		return mem_img_route;
	}
	public void setMem_img_route(String mem_img_route) {
		this.mem_img_route = mem_img_route;
	}
	public String getMem_nicknme() {
		return mem_nicknme;
	}
	public void setMem_nicknme(String mem_nicknme) {
		this.mem_nicknme = mem_nicknme;
	}
	public String getReqst_codi_img_route() {
		return reqst_codi_img_route;
	}
	public void setReqst_codi_img_route(String reqst_codi_img_route) {
		this.reqst_codi_img_route = reqst_codi_img_route;
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
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getCodi_reqst_date() {
		return codi_reqst_date;
	}
	public void setCodi_reqst_date(String codi_reqst_date) {
		this.codi_reqst_date = codi_reqst_date;
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
	public int getReqstCodi_seq() {
		return reqstCodi_seq;
	}
	public void setReqstCodi_seq(int reqstCodi_seq) {
		this.reqstCodi_seq = reqstCodi_seq;
	}            
}