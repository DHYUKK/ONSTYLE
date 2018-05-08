package net.su.admin.codi.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.su.logger.Logger;
import net.su.admin.codi.service.AdminCodiShrService;
import net.su.admin.codi.vo.AdminCodiShrVO;

@Controller
public class AdminCodiShrController {
	
	@Resource
	private AdminCodiShrService adminCodiShrService;
	
	@RequestMapping(value = "/adminCodiShr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCodiShr(Model model, AdminCodiShrVO shrVO) {
		Logger.info("코디공유 게시판");
		model.addAttribute("pageSearchInfo", shrVO);

		return "adminView/codi/codiShr/codiShrHome";
	}
	
	//코디 공유  목록 조회
	@RequestMapping(value = "/adminCodiShrList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCodiShrList(Model model, AdminCodiShrVO shrVO) throws Exception {
		Logger.info("코디공유  목록 조회");
		List<AdminCodiShrVO> adminCodiShrList = adminCodiShrService.adminCodiShrList(shrVO);
		Logger.info("shrVO.getFirstRecordIndex()  ::  "+shrVO.getFirstRecordIndex());

		model.addAttribute("shrList", adminCodiShrList);
		model.addAttribute("pageSearchInfo", shrVO);
		Logger.info("shrVO.getTotalRecordCount()  ::  "+shrVO.getTotalRecordCount());
		Logger.info("shrVO.getTotalPageCount()  ::  "+shrVO.getTotalPageCount());
		

		
		return "adminView/codi/codiShr/codiShrList";
	}
	
	//코디공유 게시글 삭제
	@RequestMapping(value = "/adminShrDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminShrDelete(Model model, AdminCodiShrVO shrVO) throws Exception {
		Logger.info("코디공유 게시글 삭제");
		adminCodiShrService.adminShrDelete(shrVO);
		
		if(shrVO.getLocation()==0){
			return "forward:/adminCodiShrList.do";
		} else{
			return "forward:/adminCodiShr.do";
		}
	}
	
	//코디공유 게시판 상세보기
	@RequestMapping(value = "/codiShrRead.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String codiShrRead(Model model, AdminCodiShrVO shrVO) throws Exception {
		Logger.info("코디공유 게시판 상세보기");
		//페이징정보
		model.addAttribute("pageSearchInfo", shrVO);

		//상세보기
		shrVO = adminCodiShrService.codiShrRead(shrVO);
		model.addAttribute("codiView", shrVO);
		
		//회원 다른 코디 조회
		List<AdminCodiShrVO> memCodiList = adminCodiShrService.memCodiList(shrVO);
		model.addAttribute("memCodiList", memCodiList);
		
		//코디 활용 상품 조회
		List<AdminCodiShrVO> codiUseProdct = adminCodiShrService.codiUseProdct(shrVO);
		model.addAttribute("codiUseProdct", codiUseProdct);
		
		//댓글조회
		shrVO.setRecordCountPerPage(5);
		List<AdminCodiShrVO> replyList = adminCodiShrService.replyList(shrVO);
		model.addAttribute("replyList", replyList);
		model.addAttribute("pageInfo", shrVO);

		return "adminView/codi/codiShr/codiShrRead";
	}
	
	//댓글 삭제
	@RequestMapping(value = "/adminDeleteReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminDeleteReply(Model model, AdminCodiShrVO shrVO) throws Exception {
		Logger.info("댓글 삭제");
		
		adminCodiShrService.adminDeleteReply(shrVO);
		
		return "forward:/codiShrRead.do";
	}
	
	/**
	* 댓글 추가 조회
	*
	* @param	CodiShrVO codiShrVO
	* @return  @ResponseBody List<CodiShrVO> replyList 
	* @exception  Exception
	*/
	@ResponseBody
	@RequestMapping(value = "/moreReply.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<AdminCodiShrVO> moreReply(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("댓글 추가 조회");
		shrVO.setRecordCountPerPage(5);
		List<AdminCodiShrVO> replyList = adminCodiShrService.moreReply(shrVO);
	 
		return replyList;
	}
}
