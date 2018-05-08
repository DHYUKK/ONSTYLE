package net.su.admin.ordr.service;

import java.util.List;

import net.su.consmr.ordr.vo.OrdrVO;

public interface AdminOrdrService {
//	주문관리 조회 갯수나타내기
	public List<OrdrVO> all(OrdrVO ordrVO) throws Exception;
//	주문관리메뉴에서  입금전 관리로 -
	public List<OrdrVO> creditselect(OrdrVO ordrVO) throws Exception;
//  입금전관리에서 처리여부 변경 - 
	public void stateUpdete(OrdrVO ordrVO) throws Exception;
//	주문관리메뉴에서 상품준비중 관리로 - 
	public List<OrdrVO> prodctsselect(OrdrVO ordrVO) throws Exception;
//	상품준비중관리에서 처리여부 변경 - 
	public void prodctsUpdate(OrdrVO ordrVO) throws Exception; 
//	주문관리에서 배송준비중 관리로 -
	public List<OrdrVO> shippingReselect(OrdrVO ordrVO) throws Exception;
//	배송준비중관리에서 처리여부 변경 - 
	public void shippingReUpdete(OrdrVO ordrVO) throws Exception; 
// 	배송준비중에서 송장번호 조회 하기
	public List<OrdrVO> orderInforSeselect(OrdrVO ordrVO) throws Exception;
//	송장번호 업뎃 하기
	public void ordrInUpdete(OrdrVO ordrVO) throws Exception; 
//	주문관리메뉴에서 배송중 관리로 -
	public List<OrdrVO> shippingsselects(OrdrVO ordrVO) throws Exception;
//	배송준비중관리에서 처리여부 변경 - 
	public void shippingUpdete(OrdrVO ordrVO) throws Exception; 
//	주문관리에서 배송완료 관리로 -
	public List<OrdrVO> shippingFinselects(OrdrVO ordrVO) throws Exception;
//	주문관리에서 전체주문 관리로 -
	public List<OrdrVO> allOrderselects(OrdrVO ordrVO) throws Exception;
//	주문관리에서 입급전 취소 관리로 -
	public List<OrdrVO> creditsselect(OrdrVO ordrVO) throws Exception;
//	주문관리메뉴에서 입급후 취소 관리로 -
	public List<OrdrVO> creditWooselect(OrdrVO ordrVO) throws Exception;
//	주문관리메뉴에서 교환 관리로 -
	public List<OrdrVO> exchangeselect(OrdrVO ordrVO) throws Exception;
//	주문관리메뉴에서 반품 관리로 -
	public List<OrdrVO> returnselect(OrdrVO ordrVO) throws Exception;
	
	
	
	
	
}
