package net.su.admin.prodct.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.admin.prodct.dao.AdminProdctDisplyDAO;
import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class AdminProdctDisplyServiceImpl implements AdminProdctDisplyService{

	@Resource
	AdminProdctDisplyDAO adminProdctDisplayDao;
	
	//카테고리 조회
	public List<AdminProdctVO> selectCategoryList() throws Exception{
		Logger.info(null);
		List<AdminProdctVO> categoryList = adminProdctDisplayDao.selectCategoryList();
		
		return categoryList;
	}
	
	//카테고리별 상품 조회 
	public List<AdminProdctVO> categoryProdctList(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		List<AdminProdctVO> categoryProdctList = adminProdctDisplayDao.categoryProdctList(adminProdctVo);
		
		return categoryProdctList;
	}
	
	//검색 진열 상품 조회
	public List<AdminProdctVO> searchProdctList(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		List<AdminProdctVO> searchProdctList = adminProdctDisplayDao.searchProdctList(adminProdctVo);
		
		return searchProdctList;
	}
	
	//상품 삭제
	public void deleteDisplyProdct(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		adminProdctDisplayDao.deleteDisplyProdct(adminProdctVo);
	}
	
	//상품 상태변경
	public void updateProdctState(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		adminProdctDisplayDao.updateProdctState(adminProdctVo);
	}
	
	//팝업 상품 조회
	public List<AdminProdctVO> selectPopUpProdct(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		List<AdminProdctVO> selectPopUpProdct = adminProdctDisplayDao.selectPopUpProdct(adminProdctVo);
		
		return selectPopUpProdct;
	}
	
	//팝업 상품 카테고리 변경
	public void updatePopUpProdct(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		adminProdctDisplayDao.updatePopUpProdct(adminProdctVo);
	}
	
	//분류 조회
	public List<AdminProdctVO> selectCategory(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		List<AdminProdctVO> categoryList = adminProdctDisplayDao.selectCategory(adminProdctVo);
		
		return categoryList;
	}
	
	//메인 진열 순서 변경
	public void updateMainDisplyOrdr(String[] data, AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		System.out.println("displyArray = "+adminProdctVo.getDisplyArray());
		
		adminProdctDisplayDao.updateMainDisplyOrdr(data, adminProdctVo);
	}
}
