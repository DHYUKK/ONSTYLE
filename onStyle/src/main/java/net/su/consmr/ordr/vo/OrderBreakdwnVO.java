package net.su.consmr.ordr.vo;

public class OrderBreakdwnVO extends OrdrVO {
   
   private int order_breakdwn_seq;
   private int order_breakdwn_prodct_quanty;
   private String order_breakdwn_prodct_size;
   private String prodct_color_nme;
   private int order_seq;
   private int prodct_seq;

//   검색
   private String dateSearch = null; //검색
   private String oneDatepicker;   //검색조건
   private String twoDatepicker;   //검색조건
   
   public int getOrder_breakdwn_seq() {
      return order_breakdwn_seq;
   }
   public void setOrder_breakdwn_seq(int order_breakdwn_seq) {
      this.order_breakdwn_seq = order_breakdwn_seq;
   }
   public int getOrder_breakdwn_prodct_quanty() {
      return order_breakdwn_prodct_quanty;
   }
   public void setOrder_breakdwn_prodct_quanty(int order_breakdwn_prodct_quanty) {
      this.order_breakdwn_prodct_quanty = order_breakdwn_prodct_quanty;
   }
   public String getOrder_breakdwn_prodct_size() {
      return order_breakdwn_prodct_size;
   }
   public void setOrder_breakdwn_prodct_size(String order_breakdwn_prodct_size) {
      this.order_breakdwn_prodct_size = order_breakdwn_prodct_size;
   }
   public String getProdct_color_nme() {
      return prodct_color_nme;
   }
   public void setProdct_color_nme(String prodct_color_nme) {
      this.prodct_color_nme = prodct_color_nme;
   }
   public int getOrder_seq() {
      return order_seq;
   }
   public void setOrder_seq(int order_seq) {
      this.order_seq = order_seq;
   }
   public int getProdct_seq() {
      return prodct_seq;
   }
   public void setProdct_seq(int prodct_seq) {
      this.prodct_seq = prodct_seq;
   }
   
   public String getDateSearch() {
      return dateSearch;
   }
   public void setDateSearch(String dateSearch) {
      this.dateSearch = dateSearch;
   }
   public String getOneDatepicker() {
      return oneDatepicker;
   }
   public void setOneDatepicker(String oneDatepicker) {
      this.oneDatepicker = oneDatepicker;
   }
   public String getTwoDatepicker() {
      return twoDatepicker;
   }
   public void setTwoDatepicker(String twoDatepicker) {
      this.twoDatepicker = twoDatepicker;
   }
   
}