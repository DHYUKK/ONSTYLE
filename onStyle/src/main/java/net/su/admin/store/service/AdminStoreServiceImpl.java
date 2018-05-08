package net.su.admin.store.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.admin.store.dao.AdminStoreDAO;
import net.su.admin.store.vo.adminStoreValueObject;

import org.springframework.stereotype.Service;

@Service
public class AdminStoreServiceImpl implements AdminStoreService{

	@Resource
	private AdminStoreDAO adminStoreDAO;
	
	public List<adminStoreValueObject> productList(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> productList = adminStoreDAO.productList(storeVO);
		return productList;
	}
	
	public List<adminStoreValueObject> product_check_List(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> product_check_List = adminStoreDAO.product_check_List(storeVO);
		return product_check_List;
	}
	
	public void insert_yet_sale(adminStoreValueObject storeVO) {
		adminStoreDAO.insert_yet_sale(storeVO);
	}
	
	public void delete_yet_sale(adminStoreValueObject storeVO) {
		adminStoreDAO.delete_yet_sale(storeVO);
	}
	
	public void delete_check_sale(adminStoreValueObject storeVO) {
		adminStoreDAO.delete_check_sale(storeVO);
	}
	
	public void pop_defBtn(adminStoreValueObject storeVO) {
		adminStoreDAO.pop_defBtn(storeVO);
	}
	
	public List<adminStoreValueObject> p_selectList(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> p_selectList = adminStoreDAO.p_selectList(storeVO);
		return p_selectList;
	}
	
	//할인율 적용
	public void sale_percentage(adminStoreValueObject storeVO) {
		adminStoreDAO.sale_percentage(storeVO);
	}
	
	public void update_sale(adminStoreValueObject storeVO) {
		adminStoreDAO.update_sale(storeVO);
	}
	
	public void insert_sale(adminStoreValueObject storeVO) {
		adminStoreDAO.insert_sale(storeVO);
	}
	
	public List<adminStoreValueObject> select_event(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> select_event = adminStoreDAO.select_event(storeVO);
		return select_event;
	}
	
	public adminStoreValueObject select_price(adminStoreValueObject storeVO) {
		adminStoreValueObject select_price = adminStoreDAO.select_price(storeVO);
		return select_price;
	}
}
