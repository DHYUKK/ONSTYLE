package net.su.consmr.mem.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.consmr.mem.service.MemService;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MemController {
   
	@Resource
	private MemService memService;
	      
	//마이페이지에서 회원정보 비밀번호 확인으로 
	@RequestMapping(value = "/password.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String password(Model model, MemVO memVO) {
		Logger.info("마이페이지에서 회원정보 비밀번호 확인으로 ");
		return "consmrView/mem/PassWord";
	}
	//회원정보 비밀번호확인~?!?
	@RequestMapping(value = "/passCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemVO passcheck(Model model, MemVO memVO, HttpSession session) throws Exception {
		Logger.info("회원정보 비밀번호 확인 하는 곳 ");
		MemVO memseqvo = new MemVO();
		memseqvo = (MemVO)session.getAttribute("userInfo");
		//      Logger.info("회원정보 비밀번호 확인 하는 곳 "+ memseqvo.getMem_seq());
		//      Logger.info("피더블유"+ memvo.getMem_pw());
		memVO.setMem_seq(memseqvo.getMem_seq());
		memVO = memService.passCheck(memVO);
	return memVO;
	}
	//회원정보 비밀번호확인에서 회원정보조회로
	@RequestMapping(value = "/join.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(Model model, MemVO memVO, HttpSession session)  throws Exception{
		Logger.info("회원정보 비밀번호확인에서 회원정보조회로 ");
		Logger.info("호롤롤롤"+memVO.getMem_seq());
		  
		MemVO memship = memService.joinDetail(memVO);
		model.addAttribute("memship", memship);
	return "consmrView/mem/Join";
	}
	//회원정보조회에서 정보 수정완료 까지 
	@RequestMapping(value = "/upFinish.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String upFinish(Model model, MemVO memVO, HttpSession session, MultipartHttpServletRequest request)  throws Exception{
		Logger.info("회원정보조회에서 정보 수정완료 까지 ");
		MemVO memvo=(MemVO)session.getAttribute("userInfo");
		memVO.setMem_seq(memvo.getMem_seq());
		memService.upFinish(memVO,request);
//		MemVO memship = memService.joinDetail(memVO);
	return "consmrView/mem/MypageHome";
	}
}