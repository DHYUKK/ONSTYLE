package net.su.admin.ordr.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.admin.ordr.dao.AdminOrdrDAO;
import net.su.consmr.ordr.vo.OrdrVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class AdminOrdrServiceImpl implements AdminOrdrService{

	@Resource
	private AdminOrdrDAO adminOrdrDAO;
	
//	주문관리 조회 갯수나타내기
	public List<OrdrVO> all(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리 조회 갯수나타내기");
		return adminOrdrDAO.all(ordrVO);
	}
	
//	주문관리메뉴에서  입금전 관리로 -
	public List<OrdrVO> creditselect(OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  입금전 관리로 -");
		List<OrdrVO> creditList = adminOrdrDAO.creditselect(ordrVO);
		return creditList;
	}
//  입금전관리에서 처리여부 변경 -
	public void stateUpdete(OrdrVO ordrVO) throws Exception{
		Logger.info("입금전관리에서 처리여부 변경 -");
		adminOrdrDAO.stateUpdete(ordrVO);
	}
//	주문관리메뉴에서 상품준비중 관리로 - 
	public List<OrdrVO> prodctsselect(OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  상품준비중 관리로 -");
		List<OrdrVO> prodctsList = adminOrdrDAO.prodctsselect(ordrVO);
		return prodctsList;
	}
//  상품준비중 관리에서 처리여부 변경 -
	public void prodctsUpdate(OrdrVO ordrVO) throws Exception{
		Logger.info("상품준비중 관리에서 처리여부 변경 -");
		adminOrdrDAO.prodctsUpdate(ordrVO);
	}
//	주문관리에서 배송준비중 관리로 -
	public List<OrdrVO> shippingReselect(OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리에서 배송준비중 관리로 -");
		List<OrdrVO> shippingResList = adminOrdrDAO.shippingReselect(ordrVO);
		return shippingResList;
	}
//	배송준비중 관리에서 처리여부 변경 - 
	public void shippingReUpdete(OrdrVO ordrVO) throws Exception{
		Logger.info("배송준비중 관리에서 처리여부 변경 -");
		adminOrdrDAO.shippingReUpdete(ordrVO);
	}
// 	배송준비중에서 송장번호 조회 하기
	public List<OrdrVO> orderInforSeselect(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리메뉴에서  상품준비중 관리로 -");
		List<OrdrVO> orderInforSeList = adminOrdrDAO.orderInforSeselect(ordrVO);
		return orderInforSeList;
	}
//	송장번호 업뎃 하기
	public void ordrInUpdete(OrdrVO ordrVO) throws Exception{
		Logger.info("송장번호 업뎃 하기");
		adminOrdrDAO.ordrInUpdete(ordrVO);
	}
//	주문관리메뉴에서 배송중 관리로 -
	public List<OrdrVO> shippingsselects(OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리에서 배송준비중 관리로 -");
		List<OrdrVO> shippingsList = adminOrdrDAO.shippingsselects(ordrVO);
		return shippingsList;	
	}
//	배송준비중관리에서 처리여부 변경 - 
	public void shippingUpdete(OrdrVO ordrVO) throws Exception{
		Logger.info("배송준비중관리에서 처리여부 변경 ");
		adminOrdrDAO.shippingUpdete(ordrVO);
	}
//	주문관리에서 배송완료 관리로 -
	public List<OrdrVO> shippingFinselects(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리에서 배송완료 관리로 -");
		List<OrdrVO> shippingFinList = adminOrdrDAO.shippingFinselects(ordrVO);
		return shippingFinList;
	}
//	주문관리에서 전체주문 관리로 -
	public List<OrdrVO> allOrderselects(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리에서 전체주문 관리로 -");
		List<OrdrVO> allOrderList = adminOrdrDAO.allOrderselects(ordrVO);
		return allOrderList;
	}
//	주문관리에서 입급전 취소 관리로 -
	public List<OrdrVO> creditsselect(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리에서 입급전 취소 관리로 -");
		List<OrdrVO> creditsList = adminOrdrDAO.creditsselect(ordrVO);
		return creditsList;
	}
//	주문관리메뉴에서 입급후 취소 관리로 -
	public List<OrdrVO> creditWooselect(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리메뉴에서  입급후 취소 관리로 -");
		List<OrdrVO> creditWooList = adminOrdrDAO.creditWooselect(ordrVO);
		return creditWooList;
	}
//	주문관리메뉴에서 교환 관리로 -
	public List<OrdrVO> exchangeselect(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리메뉴에서  교환 관리로 -");
		List<OrdrVO> exchangeList = adminOrdrDAO.exchangeselect(ordrVO);
		return exchangeList;
	}
//	주문관리메뉴에서 반품 관리로 -
	public List<OrdrVO> returnselect(OrdrVO ordrVO) throws Exception{
		Logger.info("주문관리메뉴에서  반품 관리로 -");
		List<OrdrVO> returnList = adminOrdrDAO.returnselect(ordrVO);
		return returnList;
	}
	
	
	
	
	
}
