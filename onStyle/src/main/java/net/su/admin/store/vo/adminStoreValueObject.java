package net.su.admin.store.vo;

import java.util.List;

import net.su.admin.prodct.vo.AdminProdctVO;

public class adminStoreValueObject extends AdminProdctVO{
	private int sale_seq = 0;
	private int sale_bridge_seq = 0;
	private String sale_nme = "";
	private String sale_start_date = "";
	private String sale_end_date = "";
	private String sale_bridge_discntrate = "";
	private String sale_true = "";
	private int count_prodct = 0;
	private String time_date = "";
	
	 private List<Integer> group = null;      //팝업창에서 조회할 체크된 값들
	
	public int getSale_seq() {
		return sale_seq;
	}
	public void setSale_seq(int sale_seq) {
		this.sale_seq = sale_seq;
	}
	public int getSale_bridge_seq() {
		return sale_bridge_seq;
	}
	public void setSale_bridge_seq(int sale_bridge_seq) {
		this.sale_bridge_seq = sale_bridge_seq;
	}
	public String getSale_nme() {
		return sale_nme;
	}
	public void setSale_nme(String sale_nme) {
		this.sale_nme = sale_nme;
	}
	public String getSale_start_date() {
		return sale_start_date;
	}
	public void setSale_start_date(String sale_start_date) {
		this.sale_start_date = sale_start_date;
	}
	public String getSale_end_date() {
		return sale_end_date;
	}
	public void setSale_end_date(String sale_end_date) {
		this.sale_end_date = sale_end_date;
	}
	public String getSale_bridge_discntrate() {
		return sale_bridge_discntrate;
	}
	public void setSale_bridge_discntrate(String sale_bridge_discntrate) {
		this.sale_bridge_discntrate = sale_bridge_discntrate;
	}
	public List<Integer> getGroup() {
		return group;
	}
	public void setGroup(List<Integer> group) {
		this.group = group;
	}
	public String getSale_true() {
		return sale_true;
	}
	public void setSale_true(String sale_true) {
		this.sale_true = sale_true;
	}
	public int getCount_prodct() {
		return count_prodct;
	}
	public void setCount_prodct(int count_prodct) {
		this.count_prodct = count_prodct;
	}
	public String getTime_date() {
		return time_date;
	}
	public void setTime_date(String time_date) {
		this.time_date = time_date;
	}
	
}
