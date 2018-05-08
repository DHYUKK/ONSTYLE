package net.su.consmr.codi.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.su.consmr.codi.service.CodiShrService;
import net.su.consmr.codi.service.MyDressRoomService;
import net.su.consmr.mem.vo.MemVO;

/**
 * 코디공유게시판 컨트롤러입니다.
 * 
 * @see	net.su.consmr.codi.controller.CodiShrController
 * @version  1.0 
 * @ author 정민기
 */

@Controller
public class CodiShrController {
	
	@Resource
	private CodiShrService codiShrService;
	@Resource
	private MyDressRoomService myDressRoomService;
	
	/**
	 * 오늘 나 어때 화면을 조회해주는 메서드 입니다.
	 *
	 * @param	CodiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  X
	 * @exception  Exception
	 */
	@RequestMapping(value = "/codiShr.do", method = RequestMethod.GET)
	public String codiShr(Model model, CodiShrVO codiShrVO, MemVO memVO,HttpSession session) throws Exception {
		Logger.info("코디공유게시판");
		
		//로그인 seq 담기
		if(session.getAttribute("userInfo")!=null){
			memVO = (MemVO)session.getAttribute("userInfo");
			 codiShrVO.setMem_seq(memVO.getMem_seq());
			 
			 System.out.println("mem_seq 확인 : "+memVO.getMem_seq());
		}
		
		return "consmrView/codi/codiShr/codiShr";
	}
	
	/**
	 * 베스트 코디를 조회해주는 메서드 입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq 
	 * @return  List<CodiShrVO> bestCodiShrList
	 * @exception  Exception
	 */
	@RequestMapping(value = "/bestCodiShr.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectBestCodiShrList(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
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
		
		//베스트 코디 조회
		List<CodiShrVO> bestCodiShrList = codiShrService.selectBestCodiShrList(codiShrVO);
		model.addAttribute("bestCodiShrList", bestCodiShrList);
		
		return "consmrView/codi/codiShr/bestCodiShr";
	}

	/**
	 * 일반 코디를 조회해주는 메서드 입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  List<CodiShrVO> codiShrList
	 * @exception  Exception
	 */
	@RequestMapping(value = "/codiShrList.do", method={RequestMethod.GET, RequestMethod.POST})
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

	/**
	 * 좋아요 버튼 색상을 정해주는 메서드 입니다.
	 *
	 * @param	@RequestParam(value="memSeq") int memSeq
	 * @return  @ResponseBody List<CodiShrVO> memLikeList
	 * @exception  Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/memLikeList.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<CodiShrVO> memLikeList(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
		Logger.info(null);

		//로그인 seq 담기
		if(session.getAttribute("userInfo")!=null){
			memVO = (MemVO)session.getAttribute("userInfo");
			 codiShrVO.setMem_seq(memVO.getMem_seq());
			 
			 System.out.println("mem_seq 확인 : "+memVO.getMem_seq());
		}
		
		List<CodiShrVO> memLikeList = codiShrService.memLikeList(codiShrVO);
		
		return memLikeList;
	}
	
	/**
	 * 좋아요 개수를 조회해주는 메서드 입니다.
	 *
	 * @param	CodiShrVO codiShrVO
	 * @return  @ResponseBody codiShrVO
	 * @exception  Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/countLike.do", method={RequestMethod.GET, RequestMethod.POST})
	public CodiShrVO countLike(CodiShrVO codiShrVO, Model model) throws Exception {
		Logger.info(null);

		codiShrVO = codiShrService.countLike(codiShrVO);
		
		return codiShrVO;
	}
	
	/**
	 * 좋아요 입력 및 삭제하는 메서드 입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  @ResponseBody codiShrVO
	 * @exception  Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/like.do", method={RequestMethod.GET, RequestMethod.POST})
	public CodiShrVO like(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
		Logger.info(null);
		//로그인 seq 담기		
		memVO = (MemVO)session.getAttribute("userInfo");
		codiShrVO.setMem_seq(memVO.getMem_seq());
		
		codiShrVO = codiShrService.like(codiShrVO);
		
		return codiShrVO;
	}

	/**
	 * 스크랩 버튼 클릭 시 등록되는 메서드 입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  @ResponseBody
	 * @exception  Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/scrap.do", method={RequestMethod.GET, RequestMethod.POST})
	public String scrap(CodiShrVO codiShrVO, MemVO memVO, Model model, HttpSession session) throws Exception {
		Logger.info(null);
		//로그인 seq 담기		
		memVO = (MemVO)session.getAttribute("userInfo");
		codiShrVO.setMem_seq(memVO.getMem_seq());
		
		codiShrService.scrap(codiShrVO);
		
		return "consmrView/codi/codiShr/codiShrList"; 
	}
	
	/**
	 * 코디 상세보기 메서드 입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  codiShrVO, List<CodiShrVO> memCodiList, List<CodiShrVO> codiUseProdct, List<CodiShrVO> replyList
	 * @exception  Exception
	 */
	@RequestMapping(value = "/codiView.do", method={RequestMethod.GET, RequestMethod.POST})
	public String codiView(CodiShrVO codiShrVO, MemVO memVO,Model model, HttpSession session) throws Exception{
		Logger.info(null);

		CodiShrVO cvo = new CodiShrVO();
		
		//로그인 seq 담기
		if(session.getAttribute("userInfo")!=null){
			memVO = (MemVO)session.getAttribute("userInfo");
			model.addAttribute("mem_seq", memVO.getMem_seq());
			System.out.println("mem_seq 확인 : "+memVO.getMem_seq());
			
//			cvo.setMem_seq(memVO.getMem_seq());
			codiShrVO.setMem_seq(memVO.getMem_seq());
		}
		//목록으로 돌아가기 버튼 눌렀을 때, 이전 페이지가 어디였는지 알기 위함. 
		System.out.println("asdasdasd   "+codiShrVO.getPageCode());
		System.out.println(codiShrVO.getSortType());
		System.out.println(codiShrVO.getSelectRecordCount());
		model.addAttribute("pageInfo",codiShrVO);

		//상세보기
		codiShrVO = codiShrService.codiView(codiShrVO);
		model.addAttribute("codiView", codiShrVO);
		
		//회원 다른 코디 조회
		List<CodiShrVO> memCodiList = codiShrService.memCodiList(codiShrVO);
		model.addAttribute("memCodiList", memCodiList);
		
		//코디 활용 상품 조회
		List<CodiShrVO> codiUseProdct = codiShrService.codiUseProdct(codiShrVO);
		model.addAttribute("codiUseProdct", codiUseProdct);
		
		//댓글조회
		List<CodiShrVO> replyList = codiShrService.replyList(codiShrVO);
		model.addAttribute("replyList", replyList);
		
		//로그인 seq 담기(이제 이거 무슨 역할인지 모르겟슴....*****************근데 필요함 지우지말 것)
//		model.addAttribute("login", cvo.getMem_seq());
		
		return "consmrView/codi/codiShr/codiView";
	}
	
	/**
	 * 공유 취소 메서드입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  
	 * @exception  Exception
	 */
	@RequestMapping(value = "/cancelShr.do", method={RequestMethod.GET, RequestMethod.POST})
	public String cancelShr(CodiShrVO codiShrVO, MemVO memVO, HttpSession session) throws Exception{
		Logger.info("공유 취소 메서드");
		//로그인 seq 담기
		memVO = (MemVO)session.getAttribute("userInfo");
		codiShrVO.setMem_seq(memVO.getMem_seq());
		
		//공유 취소
		codiShrService.cancelShr(codiShrVO);
		
		return "forward:/codiShr.do";
	}
	
	/**
	 * 댓글 등록 메서드입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  
	 * @exception  Exception
	 */
	@RequestMapping(value = "/insertReply.do", method={RequestMethod.GET, RequestMethod.POST})
	public String insertReply(CodiShrVO codiShrVO, MemVO memVO, HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Logger.info(null);

		if(session.getAttribute("userInfo")!=null){
			 memVO = (MemVO)session.getAttribute("userInfo");
			 codiShrVO.setMem_seq(memVO.getMem_seq());
			 
			 model.addAttribute("mem_seq", memVO.getMem_seq());
			 System.out.println("mem_seq 확인 : "+memVO.getMem_seq());
		
			 //댓글등록
			 codiShrService.insertReply(codiShrVO);
			 
			 return "forward:/codiView.do";
		} 
		else {
			 //경고창 띄어주기  
			response.setCharacterEncoding("EUC-KR");
			PrintWriter writer = response.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('로그인 후 이용 가능합니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.flush();
			return "forward:/codiView.do";
		}
	}
	
	/**
	 * 댓글 조회 메서드입니다.
	 *
	 * @param	CodiShrVO codiShrVO
	 * @return  @ResponseBody List<CodiShrVO> replyList 
	 * @exception  Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/selectReply.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<CodiShrVO> selectReply(CodiShrVO codiShrVO, MemVO memVO, HttpSession session, Model model) throws Exception{
		Logger.info(null);
		
		//로그인 seq 잇으면 담기
		if(session.getAttribute("userInfo")!=null){
			 memVO = (MemVO)session.getAttribute("userInfo");
			 codiShrVO.setMem_seq(memVO.getMem_seq());
			 
			 model.addAttribute("mem_seq", memVO.getMem_seq());
			 System.out.println("mem_seq 확인 : "+memVO.getMem_seq());
		}
		
		//댓글조회
		List<CodiShrVO> replyList = codiShrService.replyList(codiShrVO);
		
		return replyList;
	}
	

	/**
	 * 댓글 삭제 메서드입니다.
	 *
	 * @param	CodiShrVO codiShrVO, @RequestParam(value="memSeq") int memSeq
	 * @return  
	 * @exception  Exception
	 */
	@RequestMapping(value = "/deleteReply.do", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteReply(CodiShrVO codiShrVO, MemVO memVO, HttpSession session, Model model) throws Exception{
		Logger.info(null);
		//로그인 seq 담기		
		memVO = (MemVO)session.getAttribute("userInfo");
		codiShrVO.setMem_seq(memVO.getMem_seq());
		//댓글삭제
		codiShrService.deleteReply(codiShrVO);
		
		return "forward:/codiView.do";
	}

}