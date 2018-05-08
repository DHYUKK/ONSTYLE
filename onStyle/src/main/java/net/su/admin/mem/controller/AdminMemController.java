package net.su.admin.mem.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.su.logger.Logger;
import net.su.admin.mem.service.AdminMemService;
import net.su.admin.mem.vo.AdminMemVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;

@Controller
public class AdminMemController {
	
	@Resource
	private AdminMemService adminMemService;
	//관리자 고객관리 홈
	@RequestMapping(value = "/adminMem.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String adminMem(Model model,AdminMemVO adminMemVO) {
		Logger.info("관리자 고객관리 홈");
		System.out.println("현재 페이지" + adminMemVO.getCurrentPageNo());
		model.addAttribute("pageSearchInfo", adminMemVO);
		return "adminView/mem/memHome";
	}
	
	//관리자 회원리스트 조회
	@RequestMapping(value = "/adminMemList.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String adminMemList(Model model, AdminMemVO adminMemVO) throws Exception{
		Logger.info("관리자 회원리스트");
		List<AdminMemVO> adminMemList = adminMemService.adminMemList(adminMemVO);
		model.addAttribute("adminMemList", adminMemList);
		model.addAttribute("pageSearchInfo", adminMemVO);
		return "adminView/mem/memList";
	}
	
	//관리자 회원상세조회
	@RequestMapping(value = "/adminMemRead.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String adminMemRead(Model model, AdminMemVO adminMemVO) throws Exception{
		Logger.info("관리자 회원상세조회");
		
		model.addAttribute("pageSearchInfo", adminMemVO);
		adminMemVO = adminMemService.adminMemRead(adminMemVO);
		List<OrderBreakdwnVO> adminMemOrdrList = adminMemService.adminMemOrdrList(adminMemVO);
		model.addAttribute("adminMemRead", adminMemVO);
		model.addAttribute("adminMemOrdrList", adminMemOrdrList);
		return "adminView/mem/memRead";
	}
}

