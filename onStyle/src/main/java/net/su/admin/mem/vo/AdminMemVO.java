package net.su.admin.mem.vo;

import net.su.common.security.PageVO;

public class AdminMemVO extends PageVO{
	private int mem_seq;
    private String mem_id;
    private String mem_pw;
    private String mem_name;
    private String mem_nicknme;
    private String mem_birth;
    private String mem_postcd;
    private String mem_adrs;
    private String mem_detail_adrs;
    private String mem_ph;
    private String mem_email;
    private String mem_bickLst;
    private int mem_ecash;
    private String mem_img_route;        
    private String mem_month;         
    private String mem_date;            
    private String mem_ph2;                
    private String mem_ph3;            
    private String mem_email2;
	private int mem_size_seq;
	private String mem_top_length="";//상의 총기장
	private String mem_top_shouldr=""; //상의 어깨넓이
	private String mem_top_bust=""; //상의 가슴둘레
	private String mem_top_tail_girth=""; //상의 밑단둘레
	private String mem_top_slv_length=""; //상의 소매길이
	private String mem_top_slv_opening=""; // 상의 소매통
	private String mem_top_slv_bill=""; //상의 소매선절개둘레
	private String mem_bottom_length=""; //하의 총기장
	private String mem_bottom_waist=""; //하의 허리둘레
	private String mem_bottom_hip=""; //하의 엉덩이둘레
	private String mem_bottom_thigh=""; //하의 허벅지둘레
	private String mem_bottom_tail_girth=""; //하의 밑단 둘레
	private String mem_bottom_front_width=""; //하의 앞 밑위 둘레
	private String mem_bottom_back_width=""; //하의 뒷 밑위 둘레
	
	
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
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
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
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_postcd() {
		return mem_postcd;
	}
	public void setMem_postcd(String mem_postcd) {
		this.mem_postcd = mem_postcd;
	}
	public String getMem_adrs() {
		return mem_adrs;
	}
	public void setMem_adrs(String mem_adrs) {
		this.mem_adrs = mem_adrs;
	}
	public String getMem_detail_adrs() {
		return mem_detail_adrs;
	}
	public void setMem_detail_adrs(String mem_detail_adrs) {
		this.mem_detail_adrs = mem_detail_adrs;
	}
	public String getMem_ph() {
		return mem_ph;
	}
	public void setMem_ph(String mem_ph) {
		this.mem_ph = mem_ph;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_bickLst() {
		return mem_bickLst;
	}
	public void setMem_bickLst(String mem_bickLst) {
		this.mem_bickLst = mem_bickLst;
	}
	public int getMem_ecash() {
		return mem_ecash;
	}
	public void setMem_ecash(int mem_ecash) {
		this.mem_ecash = mem_ecash;
	}
	public String getMem_img_route() {
		return mem_img_route;
	}
	public void setMem_img_route(String mem_img_route) {
		this.mem_img_route = mem_img_route;
	}
	public String getMem_month() {
		return mem_month;
	}
	public void setMem_month(String mem_month) {
		this.mem_month = mem_month;
	}
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}
	public String getMem_ph2() {
		return mem_ph2;
	}
	public void setMem_ph2(String mem_ph2) {
		this.mem_ph2 = mem_ph2;
	}
	public String getMem_ph3() {
		return mem_ph3;
	}
	public void setMem_ph3(String mem_ph3) {
		this.mem_ph3 = mem_ph3;
	}
	public String getMem_email2() {
		return mem_email2;
	}
	public void setMem_email2(String mem_email2) {
		this.mem_email2 = mem_email2;
	}
	public int getMem_size_seq() {
		return mem_size_seq;
	}
	public void setMem_size_seq(int mem_size_seq) {
		this.mem_size_seq = mem_size_seq;
	}
	public String getMem_top_length() {
		return mem_top_length;
	}
	public void setMem_top_length(String mem_top_length) {
		this.mem_top_length = mem_top_length;
	}
	public String getMem_top_shouldr() {
		return mem_top_shouldr;
	}
	public void setMem_top_shouldr(String mem_top_shouldr) {
		this.mem_top_shouldr = mem_top_shouldr;
	}
	public String getMem_top_bust() {
		return mem_top_bust;
	}
	public void setMem_top_bust(String mem_top_bust) {
		this.mem_top_bust = mem_top_bust;
	}
	public String getMem_top_tail_girth() {
		return mem_top_tail_girth;
	}
	public void setMem_top_tail_girth(String mem_top_tail_girth) {
		this.mem_top_tail_girth = mem_top_tail_girth;
	}
	public String getMem_top_slv_length() {
		return mem_top_slv_length;
	}
	public void setMem_top_slv_length(String mem_top_slv_length) {
		this.mem_top_slv_length = mem_top_slv_length;
	}
	public String getMem_top_slv_opening() {
		return mem_top_slv_opening;
	}
	public void setMem_top_slv_opening(String mem_top_slv_opening) {
		this.mem_top_slv_opening = mem_top_slv_opening;
	}
	public String getMem_top_slv_bill() {
		return mem_top_slv_bill;
	}
	public void setMem_top_slv_bill(String mem_top_slv_bill) {
		this.mem_top_slv_bill = mem_top_slv_bill;
	}
	public String getMem_bottom_length() {
		return mem_bottom_length;
	}
	public void setMem_bottom_length(String mem_bottom_length) {
		this.mem_bottom_length = mem_bottom_length;
	}
	public String getMem_bottom_waist() {
		return mem_bottom_waist;
	}
	public void setMem_bottom_waist(String mem_bottom_waist) {
		this.mem_bottom_waist = mem_bottom_waist;
	}
	public String getMem_bottom_hip() {
		return mem_bottom_hip;
	}
	public void setMem_bottom_hip(String mem_bottom_hip) {
		this.mem_bottom_hip = mem_bottom_hip;
	}
	public String getMem_bottom_thigh() {
		return mem_bottom_thigh;
	}
	public void setMem_bottom_thigh(String mem_bottom_thigh) {
		this.mem_bottom_thigh = mem_bottom_thigh;
	}
	public String getMem_bottom_tail_girth() {
		return mem_bottom_tail_girth;
	}
	public void setMem_bottom_tail_girth(String mem_bottom_tail_girth) {
		this.mem_bottom_tail_girth = mem_bottom_tail_girth;
	}
	public String getMem_bottom_front_width() {
		return mem_bottom_front_width;
	}
	public void setMem_bottom_front_width(String mem_bottom_front_width) {
		this.mem_bottom_front_width = mem_bottom_front_width;
	}
	public String getMem_bottom_back_width() {
		return mem_bottom_back_width;
	}
	public void setMem_bottom_back_width(String mem_bottom_back_width) {
		this.mem_bottom_back_width = mem_bottom_back_width;
	}
	
	
}
