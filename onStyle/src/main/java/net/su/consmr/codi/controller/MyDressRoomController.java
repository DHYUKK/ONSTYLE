package net.su.consmr.codi.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import sun.misc.BASE64Decoder;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.su.consmr.codi.service.CodiReqstService;
import net.su.consmr.codi.service.MyDressRoomService;
import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;
 









import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * 나의옷장  > 가상코디 컨트롤러입니다.
 * 
 * @see	net.su.consmr.codi.controller.MyDressRoomController
 * @version  1.0 
 * @ author 김동혁
 */

@Controller
public class MyDressRoomController {
	
	@Resource
	private MyDressRoomService myDrsRmService;
	
	@Resource
	private CodiReqstService codiReqstService;
	
	MemVO memVO = new MemVO();
	BufferedImage img, bufImg;

	//가상코디 페이지 이동
	@RequestMapping(value = "/virtualCodi.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String virtualCodi(Model model, MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("가상코디 페이지 이동");
		if(session.getAttribute("userInfo")!=null){
			return "consmrView/codi/myDressRoom/virtualCodi";
		} else {
			return "forward:/login.do";
		}
	}
	
	//옷 조회
	@RequestMapping(value = "/clothSelectList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String clothSelectList(Model model, MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("옷 조회");
		
		if(myDrsRmVO.getAdmin()!=1){	//관리자인 경우 회원seq를 들고 오기 때문에 세션 사용X
		//세션
		memVO = (MemVO)session.getAttribute("userInfo");
		myDrsRmVO.setMem_seq(memVO.getMem_seq());
		}
		List<MyDressRoomVO> clothSelect = myDrsRmService.clothSelect(myDrsRmVO);
		
		model.addAttribute("clothSelect", clothSelect);
		model.addAttribute("bigGroup", myDrsRmVO.getBigGroup());
		model.addAttribute("pageSearchInfo", myDrsRmVO);
		Logger.info("myDrsRmVO.getTotalPageCount()  ::  "+myDrsRmVO.getTotalPageCount());
		return "consmrView/codi/myDressRoom/clothSelectList";
	}
	
	//가상코디 >> 선택한 옷 정보 상세조회
	@RequestMapping(value = "/selectedClothRead.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MyDressRoomVO selectedClothRead(Model model, MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("선택한 옷 정보 조회");
		
		MyDressRoomVO clothRead = myDrsRmService.clothRead(myDrsRmVO);
		clothRead.setBigGroup(myDrsRmVO.getBigGroup());
		
		return clothRead;
	}
	
	//가상코디 >> 선택한 옷 정보 상세조회
	@RequestMapping(value = "/insertClothPopup.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertClothPopup(Model model) throws Exception {
		Logger.info("옷 등록 팝업");
		
		return "consmrView/codi/myDressRoom/insertClothPopup";
	}
	
	//나의 옷 등록
	@RequestMapping(value = "/myClothInsert.do", method ={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void myClothInsert(MultipartHttpServletRequest request, MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		//세션
		memVO = (MemVO)session.getAttribute("userInfo");
		myDrsRmVO.setMem_seq(memVO.getMem_seq());
		myDrsRmService.myClothInsert(request, myDrsRmVO);
		
	}
	
	//코디셋 조회 페이지 이동
	@RequestMapping(value = "/codiSet.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String codiSet(Model model, MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("코디셋 조회 페이지 이동");
		if(session.getAttribute("userInfo")!=null){
			model.addAttribute("myDrsRmVO",myDrsRmVO);
			return "consmrView/codi/myDressRoom/codiListFrame";
		} else {
			return "forward:/login.do";
		}
	}
	
	//코디 조회(1:나의코디, 2:답변받은 코디, 3:스크랩 코디)
	@RequestMapping(value = "/codiList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myCodiList(Model model, MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("코디 조회");
		
		//세션
		memVO = (MemVO)session.getAttribute("userInfo");
		myDrsRmVO.setMem_seq(memVO.getMem_seq());
		
		myDrsRmVO.setRecordCountPerPage(6);
		List<MyDressRoomVO> codiList = myDrsRmService.codiList(myDrsRmVO);
		
		model.addAttribute("codiList",codiList);
		model.addAttribute("pageCode",myDrsRmVO.getPageCode());
		model.addAttribute("pageInfo", myDrsRmVO);
		System.out.println("myDrsRmVO.getCurrentPageNo()"+myDrsRmVO.getCurrentPageNo());
		System.out.println("myDrsRmVO.getTotalPageCount()"+myDrsRmVO.getTotalPageCount());


		return "consmrView/codi/myDressRoom/codiList";
	}
	
	//코디공유
	@RequestMapping(value = "/shrCodi.do", method ={RequestMethod.GET, RequestMethod.POST})
	public String shrCodi(MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("코디공유");
		CodiShrVO codiShrVO = new CodiShrVO();

		codiShrVO = myDrsRmService.shrCodi(myDrsRmVO);
		if(myDrsRmVO.getLocation()==1){
		int codi_shr_seq = codiShrVO.getCodi_shr_seq();
			return "forward:/codiView.do?codi_shr_seq="+codi_shr_seq;
		} else {
			return "forward:/codiList.do";
		}
	}
	
	//스크랩취소 
	@RequestMapping(value = "/scrapCancel.do", method ={RequestMethod.GET, RequestMethod.POST})
	public String scrapCancel(MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("스크랩취소");
		//세션
		memVO = (MemVO)session.getAttribute("userInfo");
		myDrsRmVO.setMem_seq(memVO.getMem_seq());
		
		myDrsRmService.scrapCancel(myDrsRmVO);
		return "forward:/codiList.do";	
	}
	
	//코디삭제
	@RequestMapping(value = "/deleteCodi.do", method ={RequestMethod.GET, RequestMethod.POST})
	public String deleteCodi(MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("코디 삭제");
		//세션
		memVO = (MemVO)session.getAttribute("userInfo");
		myDrsRmVO.setMem_seq(memVO.getMem_seq());
		
		myDrsRmService.deleteCodi(myDrsRmVO);
		if(myDrsRmVO.getLocation()==1){
			return "forward:/codiSet.do";
		} 
		else if(myDrsRmVO.getLocation()==2){
		  return "forward:/codiShr.do";
		}
		else {
			return "forward:/codiList.do";
		}
	}
	
	//코디상세조회
	@RequestMapping(value = "/codiRead.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String codiRead(Model model, MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("코디상세조회");
		model.addAttribute("myDrsRmVO",myDrsRmVO);

		MyDressRoomVO codiInfo = myDrsRmService.codiInfo(myDrsRmVO);		//코디 및 회원 정보 조회
		model.addAttribute("codiInfo",codiInfo);
		
		return "consmrView/codi/myDressRoom/codiRead";
	}
	
	//코디에 사용된 상품 조회
	@RequestMapping(value = "/codiUsedPordct.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String codiUsedPordct(Model model, MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("코디에 사용된 상품 조회");
		
		List<MyDressRoomVO> codiRead = myDrsRmService.codiRead(myDrsRmVO);	//코디에 사용된 상품 조회
		model.addAttribute("codiRead",codiRead);
		model.addAttribute("pageCode",myDrsRmVO.getPageCode());

		return "consmrView/codi/myDressRoom/codiUsedPordct";
	}

	// 캡쳐된 화면 서버 저장
	@RequestMapping(value = "/insertCodi.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int createImage(HttpServletRequest request, HttpSession session, MyDressRoomVO myDrsRmVO, CodiReqstVO reqstVO) throws Exception {
		Logger.info("코디 저장");
		MyDressRoomVO vo = new MyDressRoomVO();
		
		int codiSaveType = myDrsRmVO.getCodiSaveType();
		vo.setCodiSaveType(codiSaveType);					//코디를 저장 하는 위치에 따라 코드번호 부여	0:사용자 코디요청, 1:나의 코디 , 2:답변받은 코디를 저장한 경우, 3:나의 코디 수정, 4:관리자 코디답변
	
		//사용자 or 관리자
		if(myDrsRmVO.getAdmin()!=1){						
			//세션
			memVO = (MemVO)session.getAttribute("userInfo");
			vo.setMem_seq(memVO.getMem_seq());
		} else {
			vo.setMem_seq(myDrsRmVO.getMem_seq());			//관리자인 경우 회원seq를 직접 들고 오기 때문에 세션 사용X
		}
		int codi_seq = myDrsRmVO.getCodi_seq();				//수정인 경우 기존 코디seq 그대로 이용
		int codiMaxSeq = myDrsRmService.codiMaxSeq();		//코디테이블 MAX(SEQ) 조회 메서드
		
		String binaryData = myDrsRmVO.getCodi_img_route();
		FileOutputStream stream = null;
		byte[] file = null;// 해쉬 값
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			if (binaryData == null || binaryData == "") {
				throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			file = decoder.decodeBuffer(binaryData);
			
			String fileName = "";
			
			//저장(else) or 수정(3)
			if(codiSaveType==3){
				fileName = "codi"+codi_seq;	//수정
			} else {
				fileName = "codi"+codiMaxSeq;	//저장
			}
			//DB에 들어갈 폴더 주소
			vo.setCodi_img_route("/resources/consmr/codi/myDressRoom/img/myCodi/"+fileName+".png");
			
			//실제 저장 될 폴더 주소
			stream = new FileOutputStream("D:\\eclipse\\workspace\\onstyle\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
					+ "\\onStyle\\resources\\consmr\\codi\\myDressRoom\\img\\myCodi\\" + fileName + ".png");
			stream.write(file);
			stream.close();
			Logger.info("파일 작성 완료");
		} catch (Exception e) {
			Logger.info("파일이 정상적으로 넘어오지 않았습니다");
		} finally {
			stream.close();
		}
		
		//수정인 경우와 코디등록인 경우 구분
		if(codiSaveType==3){								
			vo.setCodi_seq(codi_seq);
			myDrsRmService.updateCodi(vo);					//수정한 코디 업데이트
			myDrsRmService.deleteUsedCloth(myDrsRmVO); 		//수정한 코디에 사용된 옷 : 새로 추가되는 옷이 있을 수 있으니, 수정 개념이 아닌 삭제 후 재등록 개념
			myDrsRmVO.setCodi_seq(codi_seq);				//
			
			if(myDrsRmVO.getReadPageNme().equals("reqst")){
				codiReqstService.codiReqstUpdate(reqstVO);	//코디요청 멘트 수정
			} else if(myDrsRmVO.getReadPageNme().equals("answr")){
				codiReqstService.codiAnswrUpdate(reqstVO);	//코디답변 멘트 수정
			}
		} else{
			myDrsRmService.insertCodi(vo); //코디 저장 메서드
			myDrsRmVO.setCodi_seq(codiMaxSeq);
		}
		
		myDrsRmService.insertCodiUsedCloth(myDrsRmVO); //코디에 사용된 옷 등록 메서드
		
		//등록인 경우 코디요청과 코디답변 구분
		if(codiSaveType==0){
			myDrsRmService.insertReqst(reqstVO);	//코디요청 등록 메서드
		} else if(codiSaveType==4){
			myDrsRmService.insertAnswr(reqstVO);	//코디답변 등록 메서드
		}
		
		return codi_seq;
	}
	
	//나의 코디 수정 페이지
	@RequestMapping(value = "/myCodiUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myCodiUpdate(Model model, MyDressRoomVO myDrsRmVO, CodiReqstVO reqstVO) throws Exception {
		Logger.info("나의 코디 수정 페이지");
		if(myDrsRmVO.getReadPageNme().equals("reqst")){
			reqstVO = myDrsRmService.codiReqstReadInfo(myDrsRmVO);	//수정 코디요청 멘트 조회
		}
		model.addAttribute("myDrsRmVO",myDrsRmVO);
		model.addAttribute("reqstVO",reqstVO);
		
		return "consmrView/codi/myDressRoom/myCodiUpdate";
	}
	
	//나의 코디에 사용된 옷 조회
	@RequestMapping(value = "/usedClothSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<MyDressRoomVO> usedClothList(Model model, MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("나의 코디에 사용된 옷 조회");
		
		List<MyDressRoomVO> usedClothList = myDrsRmService.usedClothList(myDrsRmVO);
		
		return usedClothList;
	}
	
//정우 추가
	//나의 옷장 조회
	@RequestMapping(value = "/appMyDressRoomSelectList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<MyDressRoomVO> appMyDressRoomSelectList(Model model, MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("나의 옷장 조회");
		
		return myDrsRmService.appMyDressRoomSelectList(myDrsRmVO);
	}
}