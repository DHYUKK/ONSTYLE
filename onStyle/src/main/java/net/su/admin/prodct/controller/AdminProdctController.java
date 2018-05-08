 package net.su.admin.prodct.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.logger.Logger;
import net.su.admin.prodct.service.AdminProdctDisplyService;
import net.su.admin.prodct.service.AdminProdctService;
import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.consmr.prodct.service.ProdctService;
import net.su.consmr.prodct.vo.ProdctVO;

@Controller
public class AdminProdctController {
	@Resource
	private AdminProdctService adminProdctService;
	@Resource
	private AdminProdctDisplyService adminProdctDisplyService;
	@Resource
	private ProdctService prodctService;
	
	@RequestMapping(value = "/adminProdct.do", method = RequestMethod.GET)
	public String adminProdct(Model model) {
		Logger.info("관리자 상품관리 홈");
		
		return "adminView/prodct/prodctHome";
	}
	//상품등록페이지화면이동
	@RequestMapping(value = "/adminProdctInsertPage.do", method = RequestMethod.GET)
	public String adminProdctInsertPage(Model model, ProdctVO prodctVO) throws Exception {
		Logger.info("관리자 상품관리 홈");
		//상품코드 조회
		prodctVO = adminProdctService.selectProdctCode();
		model.addAttribute("prodctVO", prodctVO);
		//사이즈 리스트 조회
		if(prodctVO.getCategory_seq() != 0){
			List<ProdctVO> TempSizeList = adminProdctService.selectTempSizetList(prodctVO);
			model.addAttribute("TempSizeList", TempSizeList);
		}
		//거래처 리스트 조회
		List<ProdctVO> clientList = adminProdctService.selectClientList();
		model.addAttribute("clientList", clientList);
		return "adminView/prodct/prodctInsertPage";
	}
	//상품 컬러 팝업
	@RequestMapping(value = "/adminProdctColorPopUp.do", method = RequestMethod.GET)
	public String adminProdctColorPopUp(Model model) {
		Logger.info("관리자 상품관리 홈");
		
		return "adminView/prodct/prodctColorPopUp";
	}
	//상품 사이즈 팝업
	@RequestMapping(value = "/adminProdctSizePopUp.do", method = RequestMethod.GET)
	public String adminProdctSizePopUp(Model model, ProdctVO prodctVO) {
		Logger.info("관리자 상품관리 홈");
		System.out.println(prodctVO.getCategory_seq()+"@@@@@@@@");
		model.addAttribute("category_seq", prodctVO.getCategory_seq());
		
		
		return "adminView/prodct/prodctSizePopUp";
	}

	
	//상품 사이즈 임시테이블 등록
	@RequestMapping(value = "/ImsiInsertProdctSize.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ImsiInsertProdctSize(Model model, ProdctVO prodctVO) throws Exception {
		Logger.info("사이즈 임시등록");

		if(prodctVO.getProdct_seq() != 0){
			List<ProdctVO> TempSizeList = adminProdctService.selectTempSizetList(prodctVO);
			model.addAttribute("TempSizeList", TempSizeList);
		}
		System.out.println("카테고리 seq : " + prodctVO.getCategory_seq());
		model.addAttribute("category_seq", prodctVO.getCategory_seq());
		return "adminView/prodct/tempSizePage";
	}
	//상품 사이즈 임시테이블 삭제
	@RequestMapping(value = "/deleteTempSize.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteTempSize(Model model, ProdctVO prodctVO) throws Exception {
		Logger.info("사이즈 임시등록");
		System.out.println(prodctVO.getProdct_seq()+"@@@cc");
		adminProdctService.deleteTempSize(prodctVO);
		
		List<ProdctVO> TempSizeList = adminProdctService.selectTempSizetList(prodctVO);
		model.addAttribute("TempSizeList", TempSizeList);
		model.addAttribute("category_seq", prodctVO.getCategory_seq());
		return "adminView/prodct/tempSizePage";
	}
	//상품등록
	@RequestMapping(value = "/adminProdctInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int adminProdctInsert(Model model, ProdctVO prodctVO, HttpSession session) throws Exception{
		Logger.info("상품등록");
		
		System.out.println(prodctVO.getProdct_detail()+"@@컨트롤러에서 에디터 값 확인");
		adminProdctService.adminProdctInsert(prodctVO, session);
		
		return prodctVO.getProdct_seq();
	}
	//이미지등록
	@RequestMapping(value = "/adminProdctImgCreate.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String adminProdctImgCreate(MultipartHttpServletRequest request, ProdctVO prodctVO, HttpSession session) throws Exception {
		Logger.info(null);
		System.out.println("이미지등록할 때 상품 seq" + prodctVO.getProdct_seq());
		adminProdctService.adminProdctImgCreate(request, prodctVO, session);
	
		return "dummy";
	}
	//컬러등록
	@RequestMapping(value = "/adminProdctColorInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminProdctColorInsert(Model model,ProdctVO prodctVO) throws Exception{
		Logger.info("상품등록");
		System.out.println(prodctVO.getColorGroup()+"색상그룹");

		System.out.println(prodctVO.getProdct_seq()+"@@");
		adminProdctService.adminProdctColorInsert(prodctVO);
		
		return "redirect:/adminProdctInsertPage.do";
	}
	//취소버튼시
	@RequestMapping(value = "/adminSizeDeleteAll.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminSizeDeleteAll(Model model, ProdctVO prodctVO) throws Exception{
		Logger.info("임시사이즈 삭제");

		adminProdctService.deleteTempSize(prodctVO);
		
		return "redirect:/adminProdctDisply.do";
	}
	//상품 수정 페이지
	@RequestMapping(value = "/prodctUpdatePage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String prodctUpdatePage(Model model, ProdctVO prodctVO) throws Exception{
		Logger.info("상품수정");
//		상품 상세보기
		prodctVO = prodctService.prodctView(prodctVO);	
		model.addAttribute("prodctVO", prodctVO);
//		상품 색상 조회
		List<ProdctVO> prodctColorList= prodctService.selectProdctColor(prodctVO);
		model.addAttribute("prodctColorList", prodctColorList);
//		거래처 조회
		List<ProdctVO> clientList = adminProdctService.selectClientList();
		model.addAttribute("clientList", clientList);
		
		return "adminView/prodct/prodctUpdatePage";
	}
//	상품수정
	@ResponseBody
	@RequestMapping(value = "/prodctUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void prodctUpdate(Model model, ProdctVO prodctVO, HttpSession session) throws Exception{
		Logger.info("상품수정");
		
		adminProdctService.prodctUpdate(prodctVO, session);
	}
	@RequestMapping(value = "/prodctUpdateColorPage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String prodctUpdateColorPage(Model model, ProdctVO prodctVO) throws Exception{
		Logger.info("상품수정");
//		상품 색상 조회
		List<ProdctVO> prodctColorList= prodctService.selectProdctColor(prodctVO);
		model.addAttribute("prodctColorList", prodctColorList);
		return "adminView/prodct/prodctUpdateColorPage";
	}
	
	@RequestMapping(value = "/prodctColorDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String prodctColorDelete(Model model, ProdctVO prodctVO) throws Exception{
		Logger.info("상품수정");
		adminProdctService.prodctColorDelete(prodctVO);
		return "forward:/prodctUpdateColorPage.do";
	}
}
