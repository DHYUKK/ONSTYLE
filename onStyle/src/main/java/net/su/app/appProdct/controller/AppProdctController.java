package net.su.app.appProdct.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.app.appProdct.service.AppProdctService;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.prodct.service.ProdctService;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.consmr.prodct.vo.ShpbagVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AppProdctController {
	@Resource
	private ProdctService prodctService;
	@Resource
	private AppProdctService appProdctService;
	
	//상품 전체 조회
	@ResponseBody
	@RequestMapping(value = "/appProdctSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<ProdctVO> prodctFrameSelect(Model model, ProdctVO prodctVO) throws Exception {
		Logger.info("app 상품 조회, "+prodctVO.getCategory_seq());
		
		List<ProdctVO> prodctList = prodctService.prodctSelect(prodctVO);
		model.addAttribute("prodctList", prodctList);
		
		return prodctList;
	}
	
	//상품 상세보기
	@ResponseBody
	@RequestMapping(value = "/appProdctView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ProdctVO prodctView(Model model, HttpSession session, ProdctVO prodctVO, MemVO memVO, CodiShrVO codiShrVO) throws Exception {		
		Logger.info("app 상품 상세보기");
		
		//상품 상세보기
		prodctVO = prodctService.prodctView(prodctVO);	
		model.addAttribute("prodctVO", prodctVO); 
		
		return prodctVO;
	}
	
	//상품 색상 조회
	@ResponseBody
	@RequestMapping(value = "/appProdctColor.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<ProdctVO> prodctColor(Model model, HttpSession session, ProdctVO prodctVO, MemVO memVO, CodiShrVO codiShrVO) throws Exception {		
		Logger.info("app 상품 색상 조회");
		
		List<ProdctVO> prodctColorList= prodctService.selectProdctColor(prodctVO);
		model.addAttribute("prodctColorList", prodctColorList);
		
		return prodctColorList;
	}	

	//상품 사이즈 조회
	@ResponseBody
	@RequestMapping(value = "/appProdctSize.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<ProdctVO> prodctSize(Model model, HttpSession session, ProdctVO prodctVO, MemVO memVO, CodiShrVO codiShrVO) throws Exception {		
		Logger.info("app 상품 사이즈 조회");
		
		List<ProdctVO> prodctSizeList = prodctService.selectProdctSize(prodctVO);
		model.addAttribute("prodctSizeList", prodctSizeList);	
		
		return prodctSizeList;
	}
	
	//장바구니 담기
	@ResponseBody
	@RequestMapping(value = "/appCartInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void cartInsert(Model model, ShpbagVO shpbagVO, HttpSession session) throws Exception {
		Logger.info("app 상품 장바구니 등록");
		
		//로그인 햇을 때
		if(session.getAttribute("userInfo")!=null){
			System.out.println(shpbagVO);
			prodctService.cartInsert(shpbagVO);
		}
		else{			 
			System.out.println("로그인 안됫을 때");
		}
    }
	
	//장바구니 상품 조회
	@ResponseBody
	@RequestMapping(value = "/appCartSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<ShpbagVO> cart(Model model, ShpbagVO shpbagVO, HttpSession session) throws Exception {
		Logger.info("app 장바구니 조회");

		List<ShpbagVO> cartList = prodctService.crtselect(shpbagVO);
		model.addAttribute("cartList", cartList);
	       
		return cartList;
	}
	
	//장바구니 상품 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCartProdct.do", method = {RequestMethod.POST, RequestMethod.GET})
	public void deleteCartProdct(ShpbagVO shpbagVO) throws Exception {
		Logger.info("app 상품 삭제");
		appProdctService.deleteCartProdct(shpbagVO);
	}
}
