package net.su.admin.prodct.service;

import java.util.List;

import net.su.admin.prodct.vo.AdminProdctVO;

public interface AdminProdctDisplyService {
	
	//카테고리 조회
	public List<AdminProdctVO> selectCategoryList() throws Exception;
	
	//카테고리별 상품 조회
	public List<AdminProdctVO> categoryProdctList(AdminProdctVO adminProdctVo) throws Exception;
	
	//검색 진열 상품 조회
	public List<AdminProdctVO> searchProdctList(AdminProdctVO adminProdctVo) throws Exception;
	
	//상품 삭제
	public void deleteDisplyProdct(AdminProdctVO adminProdctVo) throws Exception;
	
	//상품 상태 변경
	public void updateProdctState(AdminProdctVO adminProdctVo) throws Exception;
	
	//팝업 상품 조회
	public List<AdminProdctVO> selectPopUpProdct(AdminProdctVO adminProdctVo) throws Exception;
	
	//팝업 상품 카테고리 변경
	public void updatePopUpProdct(AdminProdctVO adminProdctVo) throws Exception;
	
	//분류 조회
	public List<AdminProdctVO> selectCategory(AdminProdctVO adminProdctVo) throws Exception;
	
	//메인 진열 순서 변경
	public void updateMainDisplyOrdr(String[] data, AdminProdctVO adminProdctVo) throws Exception;

}
