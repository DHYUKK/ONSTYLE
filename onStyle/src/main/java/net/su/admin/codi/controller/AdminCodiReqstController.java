package net.su.admin.codi.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.su.logger.Logger;
import net.su.admin.codi.service.AdminCodiReqstService;
import net.su.admin.codi.vo.AdminCodiReqstVO;

@Controller
public class AdminCodiReqstController {
	
	@Resource
	private AdminCodiReqstService adminCodiReqstService;
	
	//관리자 코디요청 홈 메뉴
	@RequestMapping(value = "/adminCodiReqst.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCodiReqst(Model model, AdminCodiReqstVO reqstVO) {
		Logger.info("관리자 코디요청 홈 메뉴");
		model.addAttribute("pageSearchInfo", reqstVO);

		return "adminView/codi/codiReqst/codiReqstHome";
	}
	
	//코디요청 목록 조회
	@RequestMapping(value = "/adminCodiReqstList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCodiReqstList(Model model, AdminCodiReqstVO reqstVO) throws Exception {
		Logger.info("코디요청 목록 조회");
		List<AdminCodiReqstVO> adminCodiReqstList = adminCodiReqstService.adminCodiReqstList(reqstVO);
		
		model.addAttribute("reqstList", adminCodiReqstList);
		model.addAttribute("pageSearchInfo", reqstVO);
		
		return "adminView/codi/codiReqst/adminCodiReqstList";
	}
	
	//코디요청 삭제
	@RequestMapping(value = "/adminReqstDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminReqstDelete(AdminCodiReqstVO reqstVO) throws Exception {
		Logger.info("코디요청 삭제");
		adminCodiReqstService.adminReqstDelete(reqstVO);
		
		if(reqstVO.getLocation()==0){
		return "forward:/adminCodiReqstList.do";
		} else{
		return "forward:/adminCodiReqst.do";
		}
	}
	
	//코디요청 상세보기 
	@RequestMapping(value = "/adminCodiReqstRead.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCodiReqstRead(Model model, AdminCodiReqstVO reqstVO) throws Exception {
		Logger.info("관리자 코디요청 상세보기");
		model.addAttribute("pageSearchInfo", reqstVO);

		reqstVO = adminCodiReqstService.adminCodiReqstRead(reqstVO);

		model.addAttribute("reqstVO",reqstVO);

		return "adminView/codi/codiReqst/adminCodiReqstRead";
	}
	
	//답변 가상코디
	@RequestMapping(value = "/answrCodi.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String answrCodi(Model model, AdminCodiReqstVO reqstVO) throws Exception {
		Logger.info("답변 가상코디");

		model.addAttribute("reqstVO",reqstVO);

		return "adminView/codi/codiReqst/answrVirtualCodi";
	}
	
	//답변 코디 수정 페이지
	@RequestMapping(value = "/answrCodiUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String answrCodiUpdate(Model model, AdminCodiReqstVO reqstVO) throws Exception {
		Logger.info("답변 코디 수정 페이지");
		model.addAttribute("ReadPageNme",reqstVO.getReadPageNme());

		reqstVO = adminCodiReqstService.codiAnswrReadInfo(reqstVO);	//수정 코디요청 멘트 조회
		model.addAttribute("reqstVO",reqstVO);
		
		return "adminView/codi/codiReqst/answrCodiUpdate";
	}
}
