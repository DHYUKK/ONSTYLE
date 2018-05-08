package net.su.app.appCodi.controller;

import java.util.List;

import javax.annotation.Resource;

import net.su.app.appCodi.service.AppCodiReqstService;
import net.su.consmr.codi.service.MyDressRoomService;
import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AppCodiReqstController {

	@Resource
	private AppCodiReqstService appCodiReqstService;
	
	@Resource
	private MyDressRoomService myDrsRmService;
	
	
	//코디요청 리스트 조회
	@RequestMapping(value = "/appReqstList.do", method =  {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<CodiReqstVO> appOrderListSelect(CodiReqstVO reqstVO) throws Exception {
		Logger.info("코디요청 목록 조회");
		List<CodiReqstVO> reqstList = appCodiReqstService.appReqstList(reqstVO);
		return reqstList;
	}
	
	//코디요청 상세조회
	@RequestMapping(value = "/appReqstRead.do", method =  {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public CodiReqstVO appReqstRead(CodiReqstVO reqstVO) throws Exception {
		Logger.info("코디요청 상세 조회");
		CodiReqstVO reqstInfo = appCodiReqstService.appReqstRead(reqstVO);
		return reqstInfo;
	}
	
	//코디요청 상세조회
	@RequestMapping(value = "/appReqstUsedProdct.do", method =  {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<MyDressRoomVO> appReqstUsedProdct(MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("코디에 사용된 상품 조회");
		List<MyDressRoomVO> prodctList = myDrsRmService.codiRead(myDrsRmVO);	//코디에 사용된 상품 조회
		return prodctList;
	}
	
	
	
	
	
	
	
	
	
	
}
