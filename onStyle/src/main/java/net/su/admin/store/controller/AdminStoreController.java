package net.su.admin.store.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.su.logger.Logger;
import net.su.admin.store.service.AdminStoreService;
import net.su.admin.store.vo.adminStoreValueObject;

@Controller
public class AdminStoreController {
	@Resource
	private AdminStoreService adminStoreService;

	@RequestMapping(value = "/banner.do", method = RequestMethod.GET)
	public String adminStore(Model model) {
		Logger.info("관리자 banner관리 홈");
		
		return "adminView/store/banner";
	}
	
	@RequestMapping(value = "/store.do", method = RequestMethod.GET)
	public String Store(Model model) {
		Logger.info("관리자 행사관리 홈");
		
		return "adminView/store/storeHome";
	}
	
	@RequestMapping(value = "/eventInsert.do", method = RequestMethod.GET)
	public String eventInsert(Model model) {
		Logger.info("관리자 행사등록");
		
		return "adminView/store/eventInsert";
	}
	
	@RequestMapping(value = "/popUp_product.do", method = RequestMethod.GET)
	public String popUp_product(Model model, adminStoreValueObject storeVo) {
		Logger.info("관리자 행사등록");
		model.addAttribute("storeVo", storeVo);
		return "adminView/store/popUp_Product";
	}
	
	@ResponseBody
	@RequestMapping(value = "/select_product.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<adminStoreValueObject> select_product(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("행사팝업창 행사할 제품 조회");
		List<adminStoreValueObject> productList = adminStoreService.productList(storeVo);
		return productList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product_check_List.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<adminStoreValueObject> product_check_List(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("행사팝업창 행사 체크된 제품 조회");
		List<adminStoreValueObject> product_check_List = adminStoreService.product_check_List(storeVo);
		return product_check_List;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert_yet_sale.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void insert_yet_sale(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("행사할 제품 추가");
		adminStoreService.insert_yet_sale(storeVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete_yet_sale.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void delete_yet_sale(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("임시 상품 전체 삭제");
		adminStoreService.delete_yet_sale(storeVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete_check_sale.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void delete_check_sale(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("체크된 임시 상품 삭제");
		adminStoreService.delete_check_sale(storeVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/pop_defBtn.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void pop_defBtn(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("팝업 확인 버튼 클릭");
		adminStoreService.pop_defBtn(storeVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/p_selectList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<adminStoreValueObject> p_selectList(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("행사팝업창 행사 체크된 제품 조회");
		List<adminStoreValueObject> p_selectList = adminStoreService.p_selectList(storeVo);
		return p_selectList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sale_percentage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void sale_percentage(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("할인율 적용 클릭");
		adminStoreService.sale_percentage(storeVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "update_sale", method = {RequestMethod.GET, RequestMethod.POST})
	public void update_sale(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("할인율 적용 클릭");
		adminStoreService.update_sale(storeVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert_sale.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void insert_sale(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("행사할 제품 추가");
		adminStoreService.insert_sale(storeVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/select_event.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<adminStoreValueObject> select_event(Model model, adminStoreValueObject storeVo) throws Exception {
		Logger.info("행사팝업창 행사 체크된 제품 조회");
		List<adminStoreValueObject> select_event = adminStoreService.select_event(storeVo);
		return select_event;
	}
	
}