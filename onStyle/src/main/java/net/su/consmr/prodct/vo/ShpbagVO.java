package net.su.consmr.prodct.vo;

import java.util.List;

import com.inicis.std.util.SignatureUtil;

public class ShpbagVO extends ProdctVO  {
   private int shpbag_seq;
   private String shpbag_size;
   private int shpbag_quanty;
   private String shpbag_color;
   private int prodct_seq;
   private int mem_seq;
   private String mem_name;
//   private List<Integer> 
   
   private List<Integer> group = null;      //팝업창에서 조회할 체크된 값들
   
private List<Integer> shpbag_seq_s;
   
   private int order_price = 0;//주문 상품 총가격
   private String order_title = "";//주문이름
   private String order_flag = "";//개별결제인지 전체 결제 인지 구분하기 위한 값
   
	//////////////////////////////////////거래시 필수 값 /////////////////////////////////////////
	private String mid = "INIpayTest";      // 가맹점 ID(가맹점 수정후 고정)
	private String signKey = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";   //!!!!! 인증 !!!!!  // 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
	private String cardNoInterestQuota = "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";      // 카드 무이자 여부 설정(가맹점에서 직접 설정)
	private String cardQuotaBase = "2:3:4:5:6:11:12:24:36";      // 가맹점에서 사용할 할부 개월수 설정
	private String mKey = "";// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	private String timestamp = SignatureUtil.getTimestamp();         // util에 의해서 자동생성
	private String oid = mid+"_"+SignatureUtil.getTimestamp();   // 가맹점 주문번호(가맹점에서 직접 설정)
	private String signature = "";// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
	private String siteDomain = "http://192.168.0.44:9028";//서버 주소
	//------------------------------ 거래시 필수 값  끝 --------------------------------//
	
	
	
	
	public List<Integer> getGroup() {
		return group;
	}

	public void setGroup(List<Integer> group) {
		this.group = group;
	}
	
	public String getOrder_title() {
		return order_title;
	}
	
	public String getOrder_flag() {
		return order_flag;
	}

	public void setOrder_flag(String order_flag) {
		this.order_flag = order_flag;
	}

	public void setOrder_title(String order_title) {
		this.order_title = order_title;
	}
   public int getOrder_price() {
	   return order_price;
   }
   public void setOrder_price(int order_price) {
	   this.order_price = order_price;
   }
   public String getMid() {
	return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getSignKey() {
		return signKey;
	}
	public void setSignKey(String signKey) {
		this.signKey = signKey;
	}
	public String getCardNoInterestQuota() {
		return cardNoInterestQuota;
	}
	public void setCardNoInterestQuota(String cardNoInterestQuota) {
		this.cardNoInterestQuota = cardNoInterestQuota;
	}
	public String getCardQuotaBase() {
		return cardQuotaBase;
	}
	public void setCardQuotaBase(String cardQuotaBase) {
		this.cardQuotaBase = cardQuotaBase;
	}
	public String getmKey() {
		return mKey;
	}
	public void setmKey(String mKey) {
		this.mKey = mKey;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getSiteDomain() {
		return siteDomain;
	}
	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}
	
   public List<Integer> getShpbag_seq_s() {
	  return shpbag_seq_s;
   }
   public void setShpbag_seq_s(List<Integer> shpbag_seq_s) {
	  this.shpbag_seq_s = shpbag_seq_s;
   }
   public int getShpbag_seq() {
      return shpbag_seq;
   }
   public void setShpbag_seq(int shpbag_seq) {
      this.shpbag_seq = shpbag_seq;
   }
   public String getShpbag_size() {
      return shpbag_size;
   }
   public void setShpbag_size(String shpbag_size) {
      this.shpbag_size = shpbag_size;
   }
   public int getShpbag_quanty() {
      return shpbag_quanty;
   }
   public void setShpbag_quanty(int shpbag_quanty) {
      this.shpbag_quanty = shpbag_quanty;
   }
   public String getShpbag_color() {
      return shpbag_color;
   }
   public void setShpbag_color(String shpbag_color) {
      this.shpbag_color = shpbag_color;
   }
   public int getProdct_seq() {
      return prodct_seq;
   }
   public void setProdct_seq(int prodct_seq) {
      this.prodct_seq = prodct_seq;
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
   
   
}