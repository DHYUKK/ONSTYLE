package net.su.consmr.ordr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.ordr.service.OrdrService;
import net.su.consmr.ordr.vo.OrdrVO;
import net.su.consmr.prodct.service.ProdctService;
import net.su.consmr.prodct.vo.ShpbagVO;
import net.su.consmr.ordr.vo.EcashVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inicis.std.util.SignatureUtil;

import net.su.logger.Logger;

@Controller
public class OrdrController {
   @Resource
   private OrdrService ordrService;
   @Resource
   private ProdctService prodctService;
   
//   마이페이지에서 주문조회(주문내역조회)로
   @RequestMapping(value = "/orderlist.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String orderlist(Model model, OrderBreakdwnVO odBerkvo, HttpSession session)throws Exception {
      Logger.info("마이페이지에서 주문조회로 ");
      MemVO userInfo = new MemVO();
      userInfo = (MemVO)session.getAttribute("userInfo");
      odBerkvo.setMem_seq(userInfo.getMem_seq());
      List<OrderBreakdwnVO> odBreakList = ordrService.allselect(odBerkvo);
      model.addAttribute("ordrList", odBreakList);
      return "consmrView/ordr/OrderList";
   }
//   마이페이지에서 주문조회(취소/교환/반품 주문내역조회)로
   @RequestMapping(value = "/odexchangelist.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String odexchange(Model model, OrderBreakdwnVO odBerkvo, HttpSession session) throws Exception {
      Logger.info("마이페이지에서 주문조회(취소/교환/반품 주문내역조회)");
      MemVO userInfo = new MemVO();
      odBerkvo.setMem_seq(userInfo.getMem_seq());
      List<OrderBreakdwnVO> odexchangeList = ordrService.exchangelselect(odBerkvo);
      model.addAttribute("odexchangeList", odexchangeList);
      return "consmrView/ordr/OdExchangeList";
   }
   
//   주문조회에서 주문상세조회로
   @RequestMapping(value = "/orderetail.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String odbreakdetail(Model model, OrderBreakdwnVO odBerkvo, HttpSession session) throws Exception {
      Logger.info("주문조회에서 주문상세조회로 "); 
      MemVO userInfo = new MemVO();
      userInfo = (MemVO)session.getAttribute("userInfo");
      odBerkvo.setMem_seq(userInfo.getMem_seq());
      odBerkvo.setMem_name(userInfo.getMem_name());
      
      List<OrderBreakdwnVO> odbkList = ordrService.odbreakdetail(odBerkvo);
      session.setAttribute("odbdetail", odbkList);
      return "consmrView/ordr/OrderInformation";
   }
   
// 주문결제하기
   @RequestMapping(value = "/orderStart.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String orderStart(Model model, ShpbagVO shpbagvo, HttpSession session)throws Exception {
	   Logger.info("결제하기로 ");
	   MemVO userInfo = new MemVO();
	   userInfo = (MemVO)session.getAttribute("userInfo");
       shpbagvo.setMem_seq(userInfo.getMem_seq());
	   List<ShpbagVO> shpbagList = prodctService.crtselect(shpbagvo);
	   ShpbagVO info = new ShpbagVO();
	   
	   String order_title = "";
	   for(int i =0; i<shpbagList.size(); i++) {
		   if(shpbagList.size() <= 1) {//상품의 갯수가 한 개일 때
			   info = shpbagList.get(0);
			   shpbagvo.setOrder_title(info.getProdct_nme());
			   shpbagvo.setOrder_flag("one");
		   }else if(shpbagList.size() > 1) {//상품의 갯수가 2개 이상일 때
			   if(i == 0) {
				   int size = shpbagList.size() - 1;
				   info = shpbagList.get(i);
				   order_title = info.getProdct_nme()+"외 "+size+"개 상품";
				   shpbagvo.setOrder_title(order_title);
				   shpbagvo.setOrder_flag("all");
			   }
		   }
	   }
	   
	   ///////////////////////////// 결제 /////////////////////////////////
	   String mKey = SignatureUtil.hash(shpbagvo.getSignKey(), "SHA-256");// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	   shpbagvo.setmKey(mKey);
	   
	   int price = shpbagvo.getOrder_price();
	   if(price < 50000) {
		   price += 2500;
	   }
	   shpbagvo.setOrder_price(price);
	   
	   Map<String, String> signParam = new HashMap<String, String>();// 2.signature 생성
	   signParam.put("oid", shpbagvo.getOid());// 필수
	   signParam.put("price", shpbagvo.getOrder_price()+"");// 필수
	   signParam.put("timestamp", shpbagvo.getTimestamp());// 필수
	   String signature = SignatureUtil.makeSignature(signParam);// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
	   shpbagvo.setSignature(signature);
	   ///////////////////////////////////////////////////////////////////
	   model.addAttribute("payInfo", shpbagvo);//결제 정보 세션에 담기
	   model.addAttribute("shpbagList", shpbagList);
	   return "consmrView/ordr/OrderStart";
   }
   
// 주문시 결제금액이 변동될때(적립금을 쓴다던지..)
   @RequestMapping(value = "/orderSetSignature.do", method = {RequestMethod.GET, RequestMethod.POST})
   @ResponseBody
   public ShpbagVO orderSetSignature(Model model, ShpbagVO shpbagvo)throws Exception {
	   Map<String, String> signParam = new HashMap<String, String>();// 2.signature 생성
	   signParam.put("oid", shpbagvo.getOid());// 필수
	   signParam.put("price", shpbagvo.getOrder_price()+"");// 필수
	   signParam.put("timestamp", shpbagvo.getTimestamp());// 필수
	   String signature = SignatureUtil.makeSignature(signParam);// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
	   shpbagvo.setSignature(signature);
	   return shpbagvo;
   }
   
// 결제 정보 저장
   @RequestMapping(value = "/orderInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
   @ResponseBody
   public void orderInfo(OrdrVO ordrVo, HttpSession session)throws Exception {
	   session.setAttribute("orderInfo", ordrVo);
   }
   
// 결제 닫기
   @RequestMapping(value = "/OrderClose.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String OrderClose()throws Exception {
	   return "consmrView/ordr/OrderClose";
   }
   
// 결제 팝업
   @RequestMapping(value = "/OrderPopup.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String OrderPopup()throws Exception {
	   return "consmrView/ordr/OrderPopup";
   }
   
// 주문 후 성공 or 실패 여부 반환
   @RequestMapping(value = "/OrderReturn.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String OrderReturn(Model model)throws Exception {
	   
	   return "consmrView/ordr/OrderReturn";
   }
   
// 주문 성공 후 주문 정보를 주문테이블에 등록
   @RequestMapping(value = "/orderSuccess.do", method = {RequestMethod.GET, RequestMethod.POST})
   @ResponseBody
   public void orderSuccess(OrdrVO subVo, HttpSession session)throws Exception {
	   OrdrVO ordrVo = new OrdrVO();
	   if(session.getAttribute("orderInfo") != null) {
		   ordrVo = (OrdrVO)session.getAttribute("orderInfo");
	   }
	   ordrVo.setOrder_seq(subVo.getOrder_seq());
	   ordrVo.setOrder_date(subVo.getOrder_date());
	   ordrVo.setOrder_methd(subVo.getOrder_methd());
	   ordrVo.setOrder_sum(subVo.getOrder_sum());
	   ordrVo.setOrder_state(subVo.getOrder_state());
	   
	   ordrService.orderSuccess(ordrVo);
   }
   
//   주문자 조회
   @RequestMapping(value = "/orderMemInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
   @ResponseBody
   public MemVO orderMem(MemVO memVO)throws Exception {
	   MemVO userInfo = ordrService.orderMemInfo(memVO);
      return userInfo;
   }
   
 //	마이페이지에서 적립금 으로 
	@RequestMapping(value = "/point.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String point(Model model, EcashVO ecashvo, HttpSession session) throws Exception {
		Logger.info("마이페이지에서 적립금으로 ");
		 MemVO userInfo = new MemVO();
	      userInfo = (MemVO)session.getAttribute("userInfo");
		ecashvo.setMem_seq(userInfo.getMem_seq());
		
		List<EcashVO> pointList = ordrService.poinselect(ecashvo);
		model.addAttribute("pointList", pointList);
		return "consmrView/mem/Points";
	}
//	결제 취소 했을때 고객한테 보여질 페이지 화면 /And.do
	@RequestMapping(value = "/And.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String And(Model model, HttpSession session) throws Exception {
		
		return "consmrView/ordr/And";
	}
}