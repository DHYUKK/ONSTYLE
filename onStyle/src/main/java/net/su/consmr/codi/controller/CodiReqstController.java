package net.su.consmr.codi.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.common.security.PageVO;
import net.su.consmr.codi.service.CodiReqstService;
import net.su.consmr.codi.service.MyDressRoomService;
import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;
 







import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 코디요청 컨트롤러입니다.
 * 
 * @see	net.su.consmr.codi.controller.CodiReqstController
 * @version  1.0 
 * @ author 김동혁
 */

@Controller
public class CodiReqstController {
	
	@Resource
	private CodiReqstService codiReqstService;
	@Resource
	private MyDressRoomService myDrsRmService;
	
	MemVO memVO = new MemVO();
	
	//코디요청 페이지 이동
	@RequestMapping(value = "/reqstVirtualCodi.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reqstCodi(HttpSession session) throws Exception {
		Logger.info("코디요청 페이지 이동");
		if(session.getAttribute("userInfo")!=null){
			return "consmrView/codi/codiReqst/reqstVirtualCodi";
		} else {
			return "forward:/login.do";
		}
		
	}
	
	//코디요청 내역 페이지 이동
	@RequestMapping(value = "/reqstbreakdwn.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reqstbreakdwn(Model model, CodiReqstVO reqstVO, HttpSession session) throws Exception {
		Logger.info("코디요청 내역 페이지 이동");
		if(session.getAttribute("userInfo")!=null){
			model.addAttribute("pageSearchInfo", reqstVO);
			
			return "consmrView/codi/codiReqst/reqstBreakdwn";
		} else {
			return "forward:/login.do";
		}
		
	}
	
	//코디요청 내역 페이지 이동
	@RequestMapping(value = "/reqstList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reqstList(Model model, CodiReqstVO reqstVO, PageVO pageVO, HttpSession session) throws Exception {
		Logger.info("코디요청 내역 조회");
		
		//세션
		memVO = (MemVO)session.getAttribute("userInfo");
		reqstVO.setMem_seq(memVO.getMem_seq());
		
		List<CodiReqstVO> reqstList = codiReqstService.reqstList(reqstVO);
		model.addAttribute("reqstList",reqstList);
		model.addAttribute("pageSearchInfo", reqstVO);

		return "consmrView/codi/codiReqst/reqstList";
	}
	
	//코디요청 상세조회 페이지 이동
	@RequestMapping(value = "/reqstRead.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reqstRead(Model model, CodiReqstVO reqstVO) throws Exception {
		Logger.info("코디요청 상세조회 페이지 이동");
		model.addAttribute("pageSearchInfo",reqstVO);

		reqstVO = codiReqstService.reqstRead(reqstVO);			//요청코디 상세조회

		model.addAttribute("reqstVO",reqstVO);

		return "consmrView/codi/codiReqst/reqstRead";
	}
	
	//코디요청 삭제
	@RequestMapping(value = "/reqstDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reqstDelete(CodiReqstVO reqstVO) throws Exception {
		Logger.info("코디요청 삭제");
		codiReqstService.reqstDelete(reqstVO);
		
		if(reqstVO.getLocation()==0){
		return "forward:/reqstList.do";
		} else{
		return "forward:/reqstbreakdwn.do";
		}
	}
	
	//답변받은코디 저장
	@RequestMapping(value = "/answrSave.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String answrSave(CodiReqstVO reqstVO) throws Exception {
		Logger.info("답변받은코디 저장");
		Logger.info("reqstVO.getCodi_reqst_seq()    "+reqstVO.getCodi_reqst_seq());
		Logger.info("reqstVO.getCodi_answr_seq()    "+reqstVO.getCodi_answr_seq());
		
		codiReqstService.answrSave(reqstVO);
		return "forward:/reqstRead.do";
	}
		
}