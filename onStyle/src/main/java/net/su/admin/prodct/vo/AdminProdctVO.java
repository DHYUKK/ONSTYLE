package net.su.admin.prodct.vo;

import java.util.List;

public class AdminProdctVO {

   private List<AdminProdctVO> displyList; //순서 변경시 넘겨주는 값들
   private List<Integer> group = null;      //팝업창에서 조회할 체크된 값들
   
   private int prodct_seq;            //상품seq
   private String prodct_nme;         //상품명
   private String prodct_img_route1;   //상품 이미지 경로
   private String prodct_img_route2;
   private String prodct_img_route3;
   private String prodct_img_route4;
   
   private String prodct_regtime;      //상품 등록일자
   
   private String admin_prodct_nme;   //관리자 상품명
   private String prodct_disply_state;   //상품 진열 상태
   private String prodct_sell_state;   //상품 판매 상태
   private int prodct_price;         //상품 가격
   private int suplr_price;         //공급자 가격
   private String prodct_washtip;      //상품 세탁법
   private String prodct_matrl;      //상품 재질
   
   private int client_seq;            //고객 seq
   private int category_seq;         //카테고리 seq
   private String category_nme;      //카테고리 이름
   private String mid_category_nme;   //중분류 카테고리 이름
   private String category_sort;         //카테고리 sort
      
   private int disply_seq;            //진열 seq
   private int main_disply;         //메인 진열 순서
   private int big_group_disply;      //대분류 진열 순서
   private int mid_group_disply;      //중분류 진열 순서
   
   private String search_nme;         //검색 상품명
   private String search_category;      //검색 대분류
   private String search_mid_category;   //검색 중분류
   private String search_disply_state;   //검색 진열상태
   private String search_sell_state;   //검색 판매상태
   private String search;            //검색어
   
   private int state;               //상태변경시 구별 값
   private int displyArray = 0;      //jstree 정렬 조건 
                              //초기값은 0 = 메인 진열 
   
   
   public int getDisplyArray() {
      return displyArray;
   }
   public int getState() {
      return state;
   }
   public void setState(int state) {
      this.state = state;
   }
   public void setDisplyArray(int displyArray) {
      this.displyArray = displyArray;
   }
   public String getMid_category_nme() {
      return mid_category_nme;
   }
   public void setMid_category_nme(String mid_category_nme) {
      this.mid_category_nme = mid_category_nme;
   }
   public List<Integer> getGroup() {
      return group;
   }
   public void setGroup(List<Integer> group) {
      this.group = group;
   }
   public String getSearch() {
      return search;
   }
   public void setSearch(String search) {
      this.search = search;
   }
   public String getSearch_nme() {
      return search_nme;
   }
   public void setSearch_nme(String search_nme) {
      this.search_nme = search_nme;
   }
   public String getSearch_category() {
      return search_category;
   }
   public void setSearch_category(String search_category) {
      this.search_category = search_category;
   }
   public String getSearch_mid_category() {
      return search_mid_category;
   }
   public void setSearch_mid_category(String search_mid_category) {
      this.search_mid_category = search_mid_category;
   }
   public String getSearch_disply_state() {
      return search_disply_state;
   }
   public void setSearch_disply_state(String search_disply_state) {
      this.search_disply_state = search_disply_state;
   }
   public String getSearch_sell_state() {
      return search_sell_state;
   }
   public void setSearch_sell_state(String search_sell_state) {
      this.search_sell_state = search_sell_state;
   }
   public String getCategory_sort() {
      return category_sort;
   }
   public void setCategory_sort(String category_sort) {
      this.category_sort = category_sort;
   }
   public String getCategory_nme() {
      return category_nme;
   }
   public void setCategory_nme(String category_nme) {
      this.category_nme = category_nme;
   }
   public List<AdminProdctVO> getDisplyList() {
      return displyList;
   }
   public void setDisplyList(List<AdminProdctVO> displyList) {
      this.displyList = displyList;
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
   public int getProdct_price() {
      return prodct_price;
   }
   public void setProdct_price(int prodct_price) {
      this.prodct_price = prodct_price;
   }
   public int getSuplr_price() {
      return suplr_price;
   }
   public void setSuplr_price(int suplr_price) {
      this.suplr_price = suplr_price;
   }
   public String getProdct_washtip() {
      return prodct_washtip;
   }
   public void setProdct_washtip(String prodct_washtip) {
      this.prodct_washtip = prodct_washtip;
   }
   public String getProdct_matrl() {
      return prodct_matrl;
   }
   public void setProdct_matrl(String prodct_matrl) {
      this.prodct_matrl = prodct_matrl;
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
   public int getDisply_seq() {
      return disply_seq;
   }
   public void setDisply_seq(int disply_seq) {
      this.disply_seq = disply_seq;
   }
   public int getMain_disply() {
      return main_disply;
   }
   public void setMain_disply(int main_disply) {
      this.main_disply = main_disply;
   }
   public int getBig_group_disply() {
      return big_group_disply;
   }
   public void setBig_group_disply(int big_group_disply) {
      this.big_group_disply = big_group_disply;
   }
   public int getMid_group_disply() {
      return mid_group_disply;
   }
   public void setMid_group_disply(int mid_group_disply) {
      this.mid_group_disply = mid_group_disply;
   }
   
   

}