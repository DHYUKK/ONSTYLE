package net.su.admin.ordr.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.su.logger.Logger;
import net.su.admin.ordr.service.AdminOrdrService;
import net.su.consmr.ordr.vo.OrdrVO;

@Controller
public class AdminOrdrController {
	@Resource
	private AdminOrdrService adminOrdrService;
	
	@RequestMapping(value = "/adminOrdr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminOrdr(Model model, OrdrVO ordrVO) throws Exception {
		Logger.info("관리자 주문관리 홈");
		adminOrdrService.all(ordrVO);
		return "adminView/ordr/ordrHome";
	}
//	주문관리 조회 갯수나타내기
	@RequestMapping (value = "/all.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<OrdrVO> all(OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리 조회 갯수나타내기");
		return adminOrdrService.all(ordrVO);
	}
	
//	주문관리메뉴에서  입금전 관리로 -
	@RequestMapping (value = "/creditList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String odexchange(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  입금전 관리로 -");
		List<OrdrVO> creditList = adminOrdrService.creditselect(ordrVO);
	    model.addAttribute("CreditList", creditList);
		return "adminView/ordr/creditList";
	}
//  입금전관리에서 처리여부 변경 - 
	@RequestMapping (value = "/creditUpdete.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void stateUpdete(OrdrVO ordrVO) throws Exception {
		Logger.info("입금전관리에서 처리여부 변경 - ");
		adminOrdrService.stateUpdete(ordrVO);
	}
//	주문관리메뉴에서 상품준비중 관리로 -
	@RequestMapping (value = "/prodctReadyList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String prodctReadyList(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  상품준비중 관리로 -");
		List<OrdrVO> prodctsList = adminOrdrService.prodctsselect(ordrVO);
	    model.addAttribute("prodctsList", prodctsList);
		return "adminView/ordr/prodctReadyList";
	}
//  상품준비중 관리에서 처리여부 변경 - 
	@RequestMapping (value = "/prodctsUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void prodctsUpdate(OrdrVO ordrVO) throws Exception {
		Logger.info("입금전관리에서 처리여부 변경 - ");
		adminOrdrService.prodctsUpdate(ordrVO);
	}	
//	주문관리메뉴에서 배송준비중 관리로 -
	@RequestMapping (value = "/shippingReady.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String shippingReady(Model model, HttpSession session,  OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  배송준비중 관리로 -");
		List<OrdrVO> shippingReList = adminOrdrService.shippingReselect(ordrVO);
	    model.addAttribute("shippingReList", shippingReList);
		return "adminView/ordr/shippingReady";
	}
//  배송준비중 관리에서 처리여부 변경 - 
	@RequestMapping (value = "/shippingReUpdete.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void shippingReUpdete(OrdrVO ordrVO) throws Exception {
		Logger.info("입금전관리에서 처리여부 변경 - ");
		adminOrdrService.shippingReUpdete(ordrVO);
	}
//	배송준비중에서 송장번호 조회 하기
	@RequestMapping (value = "/orderInforSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String orderInfor(Model model, HttpSession session,  OrdrVO ordrVO) throws Exception {
		Logger.info("배송준비중에서 송장번호 조회 하기");
		List<OrdrVO> orderInforSeList = adminOrdrService.orderInforSeselect(ordrVO);
	    model.addAttribute("orderInforSeList", orderInforSeList);
		return "adminView/ordr/orderInfor";
	}
//	송장번호 업뎃 하기
	@RequestMapping (value = "/ordrInUpdete.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void ordrInUpdete(OrdrVO ordrVO) throws Exception {
		Logger.info("송장번호 업뎃 하기 - ");
		adminOrdrService.ordrInUpdete(ordrVO);
	} 
//	주문관리메뉴에서 배송중 관리로 -
	@RequestMapping (value = "/shippingList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String shippingList(Model model, HttpSession session,  OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  배송중 관리로 -");
		List<OrdrVO> shippingsList = adminOrdrService.shippingsselects(ordrVO);
	    model.addAttribute("shippingsList", shippingsList);
		return "adminView/ordr/shippingList";
	}
//  배송중 관리에서 처리여부 변경 - 
	@RequestMapping (value = "/shippingUpdete.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void shippingUpdete(OrdrVO ordrVO) throws Exception {
		Logger.info("입금전관리에서 처리여부 변경 - ");
		adminOrdrService.shippingUpdete(ordrVO);
	}
//	주문관리메뉴에서 배송완료 관리로 -
	@RequestMapping (value = "/shippingFinish.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String shippingFinish(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  배송완료 관리로 -");
		List<OrdrVO> shippingFinList = adminOrdrService.shippingFinselects(ordrVO);
	    model.addAttribute("shippingFinList", shippingFinList);
		return "adminView/ordr/shippingFinish";
	}
//	주문관리메뉴에서 전체주문 관리로 -
	@RequestMapping (value = "/allOrder.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String allOrder(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  전체주문 관리로 -");
		List<OrdrVO> allOrderList = adminOrdrService.allOrderselects(ordrVO);
	    model.addAttribute("allOrderList", allOrderList);
		return "adminView/ordr/allOrder";
	}
//	주문관리메뉴에서 입급전 취소 관리로 -
	@RequestMapping (value = "/creditCancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String creditCancel(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  입급전 취소 관리로 -");
		List<OrdrVO> creditsList = adminOrdrService.creditsselect(ordrVO);
	    model.addAttribute("creditsList", creditsList);
		return "adminView/ordr/creditCancel";
	}
//	주문관리메뉴에서 입급후 취소 관리로 -
	@RequestMapping (value = "/creditWoocancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String creditWoocancel(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  입급후 취소 관리로 -");
		List<OrdrVO> creditWooList = adminOrdrService.creditWooselect(ordrVO);
	    model.addAttribute("creditWooList", creditWooList);
		return "adminView/ordr/creditWoocancel";
	}
//	주문관리메뉴에서 교환 관리로 -
	@RequestMapping (value = "/exchangeList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String exchangeList(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  교환 관리로 -");
		List<OrdrVO> exchangeList = adminOrdrService.exchangeselect(ordrVO);
	    model.addAttribute("exchangeList", exchangeList);
		return "adminView/ordr/exchangeList";
	}
//	주문관리메뉴에서 반품 관리로 -
	@RequestMapping (value = "/returnList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String returnList(Model model, HttpSession session, OrdrVO ordrVO) throws Exception {
		Logger.info("주문관리메뉴에서  반품 관리로 -");
		List<OrdrVO> returnList = adminOrdrService.returnselect(ordrVO);
	    model.addAttribute("returnList", returnList);
		return "adminView/ordr/returnList";
	}
	

}