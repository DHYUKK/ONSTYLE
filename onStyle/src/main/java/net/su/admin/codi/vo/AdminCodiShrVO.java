package net.su.admin.codi.vo;

import java.util.List;

import net.su.common.security.PageVO;

public class AdminCodiShrVO extends PageVO{
	private int codi_shr_seq;					//코디 공유 seq
	private int codi_seq;						//코디  seq
	private String codi_shr_regtime;			//코디 공유 날짜
	private String codi_img_route;				//코디 이미지 경로
	
	private int mem_seq;						//회원  seq
	private String mem_id;						//회원 id
	private String mem_name;					//회원 이름
	private String mem_nicknme;					//회원 닉네임
	private String mem_img_route;				//회원 이미지
	private String likeCount;					//좋아요 개수
	
	private int codi_use_seq;					//코디에 사용된 옷 seq
	private int prodct_seq;						//상품 seq
	private String prodct_nme;					//상품 이름
	private String prodct_img_route1;			//상품 이미지
	private String prodct_price;				//상품 가격
	
	private int codi_reply_seq;					//댓글 seq
	private String codi_reply_contnt;			//댓글 내용
	private int reply;							// 댓글 개수
	private int reply_view;						//댓글 페이징
	
	private List<Integer> shrCheckGroup;		//선택한 코디요청 삭제
	private int location;						/*페이지 위치  0 : 전체 조회에서 삭제 후, 리스트만 조회
	 													 1 : 상세조회에서 삭제 후 , 전체 조회*/
	
	private int liked;							// 좋아요 개수
	
	public int getReply_view() {
		return reply_view;
	}
	public void setReply_view(int reply_view) {
		this.reply_view = reply_view;
	}
	public int getCodi_seq() {
		return codi_seq;
	}
	public void setCodi_seq(int codi_seq) {
		this.codi_seq = codi_seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getMem_img_route() {
		return mem_img_route;
	}
	public void setMem_img_route(String mem_img_route) {
		this.mem_img_route = mem_img_route;
	}
	public int getCodi_use_seq() {
		return codi_use_seq;
	}
	public void setCodi_use_seq(int codi_use_seq) {
		this.codi_use_seq = codi_use_seq;
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
	public String getProdct_price() {
		return prodct_price;
	}
	public void setProdct_price(String prodct_price) {
		this.prodct_price = prodct_price;
	}
	public int getCodi_reply_seq() {
		return codi_reply_seq;
	}
	public void setCodi_reply_seq(int codi_reply_seq) {
		this.codi_reply_seq = codi_reply_seq;
	}
	public String getCodi_reply_contnt() {
		return codi_reply_contnt;
	}
	public void setCodi_reply_contnt(String codi_reply_contnt) {
		this.codi_reply_contnt = codi_reply_contnt;
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
	public List<Integer> getShrCheckGroup() {
		return shrCheckGroup;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public void setShrCheckGroup(List<Integer> shrCheckGroup) {
		this.shrCheckGroup = shrCheckGroup;
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
	public String getCodi_img_route() {
		return codi_img_route;
	}
	public void setCodi_img_route(String codi_img_route) {
		this.codi_img_route = codi_img_route;
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
	public String getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}
}
