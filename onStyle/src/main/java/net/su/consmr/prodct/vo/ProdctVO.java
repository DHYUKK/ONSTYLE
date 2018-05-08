package net.su.consmr.prodct.vo;

import java.util.ArrayList;
import java.util.List;

public class ProdctVO extends ProdctColorVO{
   private int prodct_seq = 0;;
   private String prodct_nme;
   private String prodct_img_route1;
   private String prodct_img_route2;
   private String prodct_img_route3;
   private String prodct_img_route4;
   private String prodct_regtime;
   private String admin_prodct_nme;
   private String prodct_disply_state;
   private String prodct_sell_state;
   private String prodct_price;
   private String prodct_state;
   private int suplr_price;
   private int client_seq;
   private int category_seq =0;
   private int bigCategory;
   private int midCategory;
   private String prodct_detail;
   private List<Integer> sizeGroup = null;
   private List<String> colorGroup = null;
   private String client_nme;
   private int top_size_seq;
   
   
   public int getTop_size_seq() {
	return top_size_seq;
}
public void setTop_size_seq(int top_size_seq) {
	this.top_size_seq = top_size_seq;
}
public String getProdct_state() {
      return prodct_state;
   }
   public void setProdct_state(String prodct_state) {
      this.prodct_state = prodct_state;
   }
   public String getProdct_detail() {
      return prodct_detail;
   }
   public void setProdct_detail(String prodct_detail) {
      this.prodct_detail = prodct_detail;
   }
   public String getClient_nme() {
      return client_nme;
   }
   public void setClient_nme(String client_nme) {
      this.client_nme = client_nme;
   }
   public List<String> getColorGroup() {
      return colorGroup;
   }
   public void setColorGroup(List<String> colorGroup) {
      this.colorGroup = colorGroup;
   }
   public List<Integer> getSizeGroup() {
      return sizeGroup;
   }
   public void setSizeGroup(List<Integer> sizeGroup) {
      this.sizeGroup = sizeGroup;
   }
   public int getBigCategory() {
      return bigCategory;
   }
   public void setBigCategory(int bigCategory) {
      this.bigCategory = bigCategory;
   }
   public int getMidCategory() {
      return midCategory;
   }
   public void setMidCategory(int midCategory) {
      this.midCategory = midCategory;
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
   public String getProdct_img_route2() {
      return prodct_img_route2;
   }
   public void setProdct_img_route2(String prodct_img_route2) {
      this.prodct_img_route2 = prodct_img_route2;
   }
   public String getProdct_img_route3() {
      return prodct_img_route3;
   }
   public void setProdct_img_route3(String prodct_img_route3) {
      this.prodct_img_route3 = prodct_img_route3;
   }
   public String getProdct_img_route4() {
      return prodct_img_route4;
   }
   public void setProdct_img_route4(String prodct_img_route4) {
      this.prodct_img_route4 = prodct_img_route4;
   }
   public String getProdct_regtime() {
      return prodct_regtime;
   }
   public void setProdct_regtime(String prodct_regtime) {
      this.prodct_regtime = prodct_regtime;
   }
   public String getAdmin_prodct_nme() {
      return admin_prodct_nme;
   }
   public void setAdmin_prodct_nme(String admin_prodct_nme) {
      this.admin_prodct_nme = admin_prodct_nme;
   }
   public String getProdct_disply_state() {
      return prodct_disply_state;
   }
   public void setProdct_disply_state(String prodct_disply_state) {
      this.prodct_disply_state = prodct_disply_state;
   }
   public String getProdct_sell_state() {
      return prodct_sell_state;
   }
   public void setProdct_sell_state(String prodct_sell_state) {
      this.prodct_sell_state = prodct_sell_state;
   }
   public String getProdct_price() {
      return prodct_price;
   }
   public void setProdct_price(String prodct_price) {
      this.prodct_price = prodct_price;
   }
   public int getSuplr_price() {
      return suplr_price;
   }
   public void setSuplr_price(int suplr_price) {
      this.suplr_price = suplr_price;
   }

   public int getClient_seq() {
      return client_seq;
   }
   public void setClient_seq(int client_seq) {
      this.client_seq = client_seq;
   }
   public int getCategory_seq() {
      return category_seq;
   }
   public void setCategory_seq(int category_seq) {
      this.category_seq = category_seq;
   }

}