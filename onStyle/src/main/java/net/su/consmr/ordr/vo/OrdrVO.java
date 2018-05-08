package net.su.consmr.ordr.vo;

import java.util.List;

//import com.inicis.std.util.SignatureUtil;

import net.su.consmr.prodct.vo.ProdctVO;

public class OrdrVO extends ProdctVO{
   
   private int order_seq;	
   private String order_date;
   private String order_state;
   private int order_dlivy_num;
   private String order_methd;
   private int order_sum;
   private int order_use_ecash_sum;
   private String mem_postcd;
   private String mem_adrs;
   private String mem_detail_adrs;
   private String order_msg;
   private int mem_seq; //회원고유번호
   private String mem_name; //회원이름
   private String mem_ph; //회원 폰
   private String order_paree; //받는사람
   private String shpbag_size; 
   private String shpbag_quanty;
   private int order_breakdwn_prodct_quanty;
   private String order_breakdwn_prodct_size;
   private String shipping_date;
   private int stateCount; //주문관리 조회 갯수 ㅇㅇ 
   private String order_paree_ph; //받는사람 폰번
   private String order_paree_email; //받는사람 이메일
   private String order_flag = "";//개별결제인지 전체 결제 인지 구분하기 위한 값
   private List<Integer> order_seq_list;
   
   
   
	//////////////////////////////////////거래시 필수 값 /////////////////////////////////////////
//	private String mid = "INIpayTest";      // 가맹점 ID(가맹점 수정후 고정)
//	private String signKey = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";   //!!!!! 인증 !!!!!  // 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
//	private String cardNoInterestQuota = "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";      // 카드 무이자 여부 설정(가맹점에서 직접 설정)
//	private String cardQuotaBase = "2:3:4:5:6:11:12:24:36";      // 가맹점에서 사용할 할부 개월수 설정
//	private String mKey = "";// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
//	private String timestamp = SignatureUtil.getTimestamp();         // util에 의해서 자동생성
//	private String oid = mid+"_"+SignatureUtil.getTimestamp();   // 가맹점 주문번호(가맹점에서 직접 설정)
//	private String signature = "";// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
//	private String siteDomain = "http://localhost:9445";//서버 주소
	//------------------------------ 거래시 필수 값  끝 --------------------------------//
   
   
   
   
   public int getOrder_seq() {
      return order_seq;
   }
public List<Integer> getOrder_seq_list() {
	return order_seq_list;
}
public void setOrder_seq_list(List<Integer> order_seq_list) {
	this.order_seq_list = order_seq_list;
}
public String getOrder_flag() {
	return order_flag;
}
public void setOrder_flag(String order_flag) {
	this.order_flag = order_flag;
}
public String getOrder_paree_email() {
	  return order_paree_email;
   }
   public void setOrder_paree_email(String order_paree_email) {
	  this.order_paree_email = order_paree_email;
   }
   public String getOrder_paree_ph() {
      return order_paree_ph;
   }
   public void setOrder_paree_ph(String order_paree_ph) {
	  this.order_paree_ph = order_paree_ph;
   }
   public void setOrder_seq(int order_seq) {
      this.order_seq = order_seq;
   }
   public String getOrder_date() { 
      return order_date; 
   }
   public void setOrder_date(String order_date) {
      this.order_date = order_date;
   }
   public String getOrder_state() {
      return order_state;
   }
   public void setOrder_state(String order_state) {
      this.order_state = order_state;
   }
   public int getOrder_dlivy_num() {
      return order_dlivy_num;
   }
   public void setOrder_dlivy_num(int order_dlivy_num) {
      this.order_dlivy_num = order_dlivy_num;
   }
   public String getOrder_methd() {
      return order_methd;
   }
   public void setOrder_methd(String order_methd) {
      this.order_methd = order_methd;
   }
   public int getOrder_sum() {
      return order_sum;
   }
   public void setOrder_sum(int order_sum) {
      this.order_sum = order_sum;
   }
   public int getOrder_use_ecash_sum() {
      return order_use_ecash_sum;
   }
   public void setOrder_use_ecash_sum(int order_use_ecash_sum) {
      this.order_use_ecash_sum = order_use_ecash_sum;
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
   public String getOrder_msg() {
      return order_msg;   
   }
   public void setOrder_msg(String order_msg) {
      this.order_msg = order_msg;
   }
   public int getMem_seq() {
      return mem_seq;
   }
   public void setMem_seq(int mem_seq) {
      this.mem_seq = mem_seq;
   }
   public String getMem_name() {
      return mem_name;
   }
   public void setMem_name(String mem_name) {
      this.mem_name = mem_name;
   }
   public String getMem_ph() {
	return mem_ph;
   }
   public void setMem_ph(String mem_ph) {
	   this.mem_ph = mem_ph;
   }
   public String getOrder_paree() {
	   return order_paree;
   }
   public void setOrder_paree(String order_paree) {
      this.order_paree = order_paree;
   }
   public String getShpbag_size() {
	   return shpbag_size;
   }
	public void setShpbag_size(String shpbag_size) {
		this.shpbag_size = shpbag_size;
	}
	public String getShpbag_quanty() {
		return shpbag_quanty;
	}
	public void setShpbag_quanty(String shpbag_quanty) {
		this.shpbag_quanty = shpbag_quanty;
	}
	public String getOrder_breakdwn_prodct_size() {
		return order_breakdwn_prodct_size;
	}
	public void setOrder_breakdwn_prodct_size(String order_breakdwn_prodct_size) {
		this.order_breakdwn_prodct_size = order_breakdwn_prodct_size;
	}
	public int getOrder_breakdwn_prodct_quanty() {
		return order_breakdwn_prodct_quanty;
	}
	public void setOrder_breakdwn_prodct_quanty(int order_breakdwn_prodct_quanty) {
		this.order_breakdwn_prodct_quanty = order_breakdwn_prodct_quanty;
	}
	public String getShipping_date() {
		return shipping_date;
	}
	public void setShipping_date(String shipping_date) {
		this.shipping_date = shipping_date;
	}
//	public String getMid() {
//		return mid;
//	}
//	public void setMid(String mid) {
//		this.mid = mid;
//	}
//	public String getSignKey() {
//		return signKey;
//	}
//	public void setSignKey(String signKey) {
//		this.signKey = signKey;
//	}
//	public String getCardNoInterestQuota() {
//		return cardNoInterestQuota;
//	}
//	public void setCardNoInterestQuota(String cardNoInterestQuota) {
//		this.cardNoInterestQuota = cardNoInterestQuota;
//	}
//	public String getCardQuotaBase() {
//		return cardQuotaBase;
//	}
//	public void setCardQuotaBase(String cardQuotaBase) {
//		this.cardQuotaBase = cardQuotaBase;
//	}
//	public String getmKey() {
//		return mKey;
//	}
//	public void setmKey(String mKey) {
//		this.mKey = mKey;
//	}
//	public String getTimestamp() {
//		return timestamp;
//	}
//	public void setTimestamp(String timestamp) {
//		this.timestamp = timestamp;
//	}
//	public String getOid() {
//		return oid;
//	}
//	public void setOid(String oid) {
//		this.oid = oid;
//	}
//	public String getSignature() {
//		return signature;
//	}
//	public void setSignature(String signature) {
//		this.signature = signature;
//	}
//	public String getSiteDomain() {
//		return siteDomain;
//	}
//	public void setSiteDomain(String siteDomain) {
//		this.siteDomain = siteDomain;
//	}
	public int getStateCount() {
		return stateCount;
	}
	public void setStateCount(int stateCount) {
		this.stateCount = stateCount;
	}
	
	
	
	
}