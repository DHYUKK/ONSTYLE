package net.su.consmr.prodct.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.admin.store.service.AdminStoreService;
import net.su.consmr.codi.service.CodiShrService;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.prodct.service.ProdctService;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.admin.store.vo.adminStoreValueObject;
import net.su.consmr.prodct.vo.ShpbagVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProdctController {
	@Resource
	private ProdctService prodctService;
	@Resource
	private CodiShrService codiShrService;
	@Resource
	private AdminStoreService adminStoreService;
	
	@RequestMapping(value = "/prodctFrameSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String prodctFrameSelect(Model model, ProdctVO prodctVO) throws Exception {
		Logger.info("상품조회");
		model.addAttribute("category_seq", prodctVO.getCategory_seq());
		List<ProdctVO> prodctList = prodctService.prodctSelect(prodctVO);
		model.addAttribute("prodct_seq", prodctVO.getProdct_seq());
		model.addAttribute("prodctList", prodctList);
		
		return "consmrView/prodct/prodctFramePage";
	}
	
	@RequestMapping(value = "/newProdctSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String newProdctSelect(Model model, ProdctVO prodctVO, HttpSession session, MemVO memVO) throws Exception {
		Logger.info("상품 정렬");	
		
			
		return "consmrView/prodct/newProdct";
	}
	//상품 조회시 해당 상품 베스트 코디 미리보기 이미지 가져오기
	@ResponseBody
	@RequestMapping(value = "/selectProdctBestCodi.do", method = {RequestMethod.GET, RequestMethod.POST})
	public CodiShrVO selectProdctBestCodi(Model model, CodiShrVO codiShrVO) throws Exception {
		Logger.info("베스트코디조회");	
		codiShrVO = prodctService.selectProdctBestCodi(codiShrVO);
//		System.out.println("이미지 경로 제대로 가져오는지 컨트롤러에서 확인 : "+codiShrVO.getCodi_img_route());
		return codiShrVO;
	}			
	@RequestMapping(value = "/prodctView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String prodctView(Model model, HttpSession session, ProdctVO prodctVO, MemVO memVO, CodiShrVO codiShrVO,adminStoreValueObject storeVo) throws Exception {		
		Logger.info("상품 사이즈 조회");
//		로그인한 회원 정보 가져오기
		if(session.getAttribute("userInfo")!=null){
			memVO = (MemVO)session.getAttribute("userInfo");
			
			model.addAttribute("memVO", memVO);	
		}
//		상품 상세보기
		prodctVO = prodctService.prodctView(prodctVO);	
		model.addAttribute("prodctVO", prodctVO);
//		상품 색상 조회
		List<ProdctVO> prodctColorList= prodctService.selectProdctColor(prodctVO);
		model.addAttribute("prodctColorList", prodctColorList);
		//      상품 사이즈 조회
		List<ProdctVO> prodctSizeList = prodctService.selectProdctSize(prodctVO);
		model.addAttribute("prodctSizeList", prodctSizeList);		
		//		해당 상품이 활용된 베스트 코디 상세정보 가져오기
		codiShrVO.setMem_seq(memVO.getMem_seq());
		codiShrVO = prodctService.selectProdctBestCodi(codiShrVO);
		model.addAttribute("codiShrVO", codiShrVO);		
//		회원의 다른 코디리스트 가져오기		
		List<CodiShrVO> memCodiList = codiShrService.memCodiList(codiShrVO);
		model.addAttribute("memCodiList", memCodiList);
//		코디에 사용된 미스봄 상품 조회
	    List<CodiShrVO> codiUseProdct = codiShrService.codiUseProdct(codiShrVO);
	    model.addAttribute("codiUseProdct", codiUseProdct);
	    
		////////////////////////////////
		//세일가 적용
		storeVo.setProdct_seq(prodctVO.getProdct_seq());
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		storeVo.setTime_date(sdf.format(dt));
		
		storeVo = adminStoreService.select_price(storeVo);
		model.addAttribute("storeVo", storeVo);
	    //////////////////////////////////
		
		return "consmrView/prodct/prodctViewPage";
	}

//  마이페이지에서 장바구니로 
   @RequestMapping(value = "/cart.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String cart(Model model, ShpbagVO shpbagvo, HttpSession session) throws Exception {
	   Logger.info("마이페이지에서 장바구니로 ");
		  MemVO memseqvo = new MemVO();
	      memseqvo = (MemVO)session.getAttribute("userInfo");
	      shpbagvo.setMem_seq(memseqvo.getMem_seq());
	      shpbagvo.setMem_name(memseqvo.getMem_name());
	      List<ShpbagVO> shpbagList = prodctService.crtselect(shpbagvo);
	      model.addAttribute("crtList", shpbagList);
	      return "consmrView/prodct/Cart";
   }
//   상품삭제
   @RequestMapping(value = "/deletes.do", method = {RequestMethod.GET, RequestMethod.POST})
   @ResponseBody
   public void deletes(Model model, ShpbagVO shpbagvo, HttpSession session) throws Exception {
      Logger.info("상품 삭제");
      /////////////////  확인용    //////////////////
      List<Integer> seq_s = shpbagvo.getShpbag_seq_s();
      for(int seq : seq_s) {
         System.out.println("삭제할 seq들 : "+ seq);
      }
      prodctService.deletes(shpbagvo);
    }
	@RequestMapping(value = "/cartInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartInsert(Model model, ShpbagVO shpbagVO, HttpSession session) throws Exception {
		if(session.getAttribute("userInfo")!=null){
			System.out.println(shpbagVO);
			prodctService.cartInsert(shpbagVO);
			return "redirect:/cart.do";
		}
		else{			 
			return "redirect:/login.do";
		}
    }
}


