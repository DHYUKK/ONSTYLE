package net.su.app.appCodi.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.app.appCodi.service.AppCodiShrService;
import net.su.consmr.codi.service.CodiShrService;
import net.su.consmr.codi.service.MyDressRoomService;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AppCodiShrController {

	@Resource
	private CodiShrService codiShrService;
	@Resource
	private AppCodiShrService appCodiShrService;
	@Resource
	private MyDressRoomService myDrsRmService;

	//베스트 코디 조회
	@ResponseBody
	@RequestMapping(value = "/appBestCodiShr.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<CodiShrVO> selectBestCodiShrList(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
	      Logger.info("appBestCodi");

	      //오늘날짜
	      Date today = new Date();
	      SimpleDateFormat sdf = new SimpleDateFormat("dd");
	      codiShrVO.setToday(Integer.parseInt(sdf.format(today)));
	      
	      //베스트 코디 조회
	      List<CodiShrVO> bestCodiShrList = appCodiShrService.selectBestCodiShrList(codiShrVO);
	      model.addAttribute("bestCodiShrList", bestCodiShrList);
	      
	      return bestCodiShrList;
	   }
	
	//일반 코디 조회
	@ResponseBody
	@RequestMapping(value = "/appCodiShrList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectCodiShrList(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
		Logger.info(null);
		
		//로그인 seq 담기
		if(session.getAttribute("userInfo")!=null){
			memVO = (MemVO)session.getAttribute("userInfo");
			codiShrVO.setMem_seq(memVO.getMem_seq());
			model.addAttribute("mem_seq", memVO.getMem_seq());
			System.out.println("mem_seq 확인 : "+memVO.getMem_seq());
		}
		
		//오늘날짜
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		codiShrVO.setToday(Integer.parseInt(sdf.format(today)));
		
		//전체 코디 조회
		List<CodiShrVO> codiShrList = codiShrService.selectCodiShrList(codiShrVO);
		model.addAttribute("codiShrList", codiShrList);
		
		return "consmrView/codi/codiShr/codiShrList"; 
	}
	
	//like
	@ResponseBody
	@RequestMapping(value = "/appLike.do", method={RequestMethod.GET, RequestMethod.POST})
	public CodiShrVO like(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
		Logger.info("appLike "+codiShrVO.getCodi_shr_seq());
		
		codiShrVO = codiShrService.like(codiShrVO);
		
		return codiShrVO;
	}
	
	//scrap
	@ResponseBody
	@RequestMapping(value = "/appScrap.do", method={RequestMethod.GET, RequestMethod.POST})
	public String scrap(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
		Logger.info("appScrap");
		
		codiShrService.scrap(codiShrVO);
		
		return "consmrView/codi/codiShr/codiShrList"; 
	}

	//코디 상세보기
	@ResponseBody
	@RequestMapping(value = "/appCodiView.do", method={RequestMethod.GET, RequestMethod.POST})
	public CodiShrVO codiView(CodiShrVO codiShrVO, Model model) throws Exception{
		Logger.info("appCodiView");

		//상세보기
		codiShrVO = codiShrService.codiView(codiShrVO);
		model.addAttribute("codiView", codiShrVO);

//		//회원 다른 코디 조회
//		List<CodiShrVO> memCodiList = codiShrService.memCodiList(codiShrVO);
//		model.addAttribute("memCodiList", memCodiList);
//		
//		//댓글조회
//		List<CodiShrVO> replyList = codiShrService.replyList(codiShrVO);
//		model.addAttribute("replyList", replyList);
		
		return codiShrVO;
	} 
	

//	//코디 사용 옷 조회
	@ResponseBody
	@RequestMapping(value = "/appCodiUseProdct.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<CodiShrVO> codiUseProdct(CodiShrVO codiShrVO, Model model) throws Exception{
		Logger.info("app 코디 사용 옷");
		
		//코디 활용 상품 조회
		List<CodiShrVO> codiUseProdct = appCodiShrService.codiUseProdct(codiShrVO);
		model.addAttribute("codiUseProdct", codiUseProdct);
		
		return codiUseProdct;
	}
}
