package net.su.admin.store.dao;

import java.util.List;

import net.su.admin.store.vo.adminStoreValueObject;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdminStoreDAO extends SqlSessionDaoSupport{

	public List<adminStoreValueObject> productList(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> productList = getSqlSession().selectList("adminStoreMapper.productList", storeVO);
		return productList;
	}
	
	public void insert_yet_sale(adminStoreValueObject storeVO) {
		storeVO.setSale_seq(max_sale_seq(storeVO).getSale_seq());
		System.out.println("max_seq알아보기-------"+storeVO.getSale_seq());
		getSqlSession().insert("adminStoreMapper.insert_yet_sale", storeVO);
	}
	
	public adminStoreValueObject max_sale_seq(adminStoreValueObject storeVO) {
		storeVO = getSqlSession().selectOne("adminStoreMapper.max_sale_seq",storeVO);
		return storeVO; 
	}
	
	
	public List<adminStoreValueObject> product_check_List(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> product_check_List = getSqlSession().selectList("adminStoreMapper.product_check_List", storeVO);
		return product_check_List;
	}
	
	//창 닫을 시 자동 삭제
	public void delete_yet_sale(adminStoreValueObject storeVO) {
		getSqlSession().delete("adminStoreMapper.delete_yet_sale", storeVO);
	}
	
	//팝업 체크된 상품 삭제
	public void delete_check_sale(adminStoreValueObject storeVO) {
		getSqlSession().delete("adminStoreMapper.delete_check_sale",storeVO);
	}
	
	//팝업 확인 버튼 클릭시
	public void pop_defBtn(adminStoreValueObject storeVO) {
		getSqlSession().update("adminStoreMapper.pop_defBtn",storeVO);
	}
	
	//p 상태 list 조회
	public List<adminStoreValueObject> p_selectList(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> p_selectList = getSqlSession().selectList("adminStoreMapper.p_selectList", storeVO);
		return p_selectList;
	}
	
	//할인율 적용
	public void sale_percentage(adminStoreValueObject storeVO) {
		getSqlSession().update("adminStoreMapper.sale_percentage",storeVO);
	}
	
	//update to Y
	public void update_sale(adminStoreValueObject storeVO) {
		getSqlSession().update("adminStoreMapper.update_sale",storeVO);
	}
	
	//행사 등록
	public void insert_sale(adminStoreValueObject storeVO) {
		storeVO.setSale_seq(max_sale_seq(storeVO).getSale_seq());
		getSqlSession().insert("adminStoreMapper.insert_sale", storeVO);
	}
	
	//p 상태 list 조회
	public List<adminStoreValueObject> select_event(adminStoreValueObject storeVO) {
		List<adminStoreValueObject> select_event = getSqlSession().selectList("adminStoreMapper.select_event", storeVO);
		return select_event;
	}
	
	//세일가 조회
	public adminStoreValueObject select_price(adminStoreValueObject storeVO) {
		storeVO = getSqlSession().selectOne("adminStoreMapper.select_price",storeVO);
		return storeVO; 
	}
	
	
}
