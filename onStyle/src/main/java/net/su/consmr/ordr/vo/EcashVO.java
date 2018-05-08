package net.su.consmr.ordr.vo;

public class EcashVO {
	private int ecash_seq;
	private String ecash_acc;
	private String ecash_msg;
	private int order_seq;
	private int mem_seq;
	private String order_date;
	
	public int getEcash_seq() {
		return ecash_seq;
	}
	public void setEcash_seq(int ecash_seq) {
		this.ecash_seq = ecash_seq;
	}
	public String getEcash_acc() {
		return ecash_acc;
	}
	public void setEcash_acc(String ecash_acc) {
		this.ecash_acc = ecash_acc;
	}
	public String getEcash_msg() {
		return ecash_msg;
	}
	public void setEcash_msg(String ecash_msg) {
		this.ecash_msg = ecash_msg;
	}
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	
}
