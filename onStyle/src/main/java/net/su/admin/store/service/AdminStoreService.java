package net.su.admin.store.service;

import java.util.List;

import net.su.admin.store.vo.adminStoreValueObject;

public interface AdminStoreService {
	public List<adminStoreValueObject> productList(adminStoreValueObject storeVO) throws Exception;
	
	public List<adminStoreValueObject> product_check_List(adminStoreValueObject storeVO) throws Exception;
	
	public void insert_yet_sale(adminStoreValueObject storeVO) throws Exception;
	
	public void delete_yet_sale(adminStoreValueObject storeVO) throws Exception;
	
	public void delete_check_sale(adminStoreValueObject storeVO) throws Exception;
	
	public void pop_defBtn(adminStoreValueObject storeVO) throws Exception;
	
	public List<adminStoreValueObject> p_selectList(adminStoreValueObject storeVO) throws Exception; 
	
	public void sale_percentage(adminStoreValueObject storeVO) throws Exception;
	
	public void update_sale(adminStoreValueObject storeVO) throws Exception;
	
	public void insert_sale(adminStoreValueObject storeVO) throws Exception;
	
	public List<adminStoreValueObject> select_event(adminStoreValueObject storeVO) throws Exception;
	
	public adminStoreValueObject select_price(adminStoreValueObject storeVO) throws Exception;
}
