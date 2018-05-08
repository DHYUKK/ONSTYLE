
package net.su.admin.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.admin.codi.service.AdminCodiReqstService;
import net.su.admin.codi.service.AdminCodiShrService;
import net.su.admin.codi.vo.AdminCodiReqstVO;
import net.su.admin.codi.vo.AdminCodiShrVO;
import net.su.admin.main.service.AdminMainService;
import net.su.admin.main.vo.AdminMainVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMainController {
	@Resource
	private AdminMainService adminMainService;
	
	@Resource
	private AdminCodiReqstService adminCodiReqstService;
	
	@Resource
	private AdminCodiShrService adminCodiShrService;
	
	
	@RequestMapping(value = "/adminMain.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String adminMain(Model model) throws Exception {
		Logger.info("관리자 메인 홈 메뉴");
		AdminCodiReqstVO reqstVO = new AdminCodiReqstVO();
		AdminCodiShrVO shrVO = new AdminCodiShrVO();
		reqstVO.setRecordCountPerPage(5);
		shrVO.setRecordCountPerPage(5);
		
		//코디요청 현황
		List<AdminCodiReqstVO> adminCodiReqstList = adminCodiReqstService.adminCodiReqstList(reqstVO);
		model.addAttribute("reqstList", adminCodiReqstList);

		
		//코디공유게시판 
		List<AdminCodiShrVO> adminCodiShrList = adminCodiShrService.adminCodiShrList(shrVO);
		model.addAttribute("shrList", adminCodiShrList);



		return "adminView/main/adminMain";
	}
	
	@RequestMapping(value = "/adminTopMenu.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String adminTopMenu(Model model) {
		Logger.info("관리자 상단 메뉴");
		
		return "adminView/main/adminTopMenu";
	}
	
	@RequestMapping(value = "/adminLeftMenu.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLeftMenu(Model model, AdminMainVO adminMainVO) {
		Logger.info("관리자 좌측 메뉴");

		model.addAttribute("menuCategry", adminMainVO.getMenuCategry());
		return "adminView/main/adminLeftMenu";
	}
	
	@RequestMapping(value = "/adminBootswatch.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminBootswatch(Model model) {
		Logger.info("관리자 상단 메뉴");
		
		return "adminView/main/adminBootswatch";
	}
}
