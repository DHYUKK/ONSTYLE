package net.su.admin.prodct.dao;

import java.util.List;

import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProdctDisplyDAO extends SqlSessionDaoSupport{

	//카테고리 조회
	public List<AdminProdctVO> selectCategoryList() throws Exception{
		Logger.info(null);
		List<AdminProdctVO> categoryList = getSqlSession().selectList("adminProdctDisplyMapper.selectCategoryList");
		
		return categoryList;
	}
	
	//카테고리별 상품 조회 
	public List<AdminProdctVO> categoryProdctList(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null+"displyArray : "+adminProdctVo.getDisplyArray());
		List<AdminProdctVO> categoryProdctList = getSqlSession().selectList("adminProdctDisplyMapper.categoryProdctList", adminProdctVo);
		
		return categoryProdctList;
	}
	
	//검색 진열 상품 조회
	public List<AdminProdctVO> searchProdctList(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		List<AdminProdctVO> searchProdctList = getSqlSession().selectList("adminProdctDisplyMapper.searchProdctList", adminProdctVo);
		
		return searchProdctList;
	}
	
	//상품 삭제
	public void deleteDisplyProdct(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		
		getSqlSession().delete("adminProdctDisplyMapper.deleteDisplyProdct", adminProdctVo);
	}
	
	//상품 상태 업데이트
	public void updateProdctState(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		
		getSqlSession().update("adminProdctDisplyMapper.updateProdctState", adminProdctVo);
	}
	
	//팝업 상품 조회
	public List<AdminProdctVO> selectPopUpProdct(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		List<AdminProdctVO> selectPopUpProdct = getSqlSession().selectList("adminProdctDisplyMapper.selectPopUpProdct", adminProdctVo);
		
		return selectPopUpProdct;
	}
	
	//팝업 상품 카테고리 변경
	public void updatePopUpProdct(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		
		getSqlSession().selectList("adminProdctDisplyMapper.updatePopUpProdct", adminProdctVo);
	}
	
	//분류 조회
	public List<AdminProdctVO> selectCategory(AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null);
		List<AdminProdctVO> categoryList = getSqlSession().selectList("adminProdctDisplyMapper.selectCategory", adminProdctVo); 
		
		return categoryList;
	}
	
	//메인 진열 순서 변경
	public void updateMainDisplyOrdr(String[] data, AdminProdctVO adminProdctVo) throws Exception{
		Logger.info(null); 
		System.out.println("displyArray = "+adminProdctVo.getDisplyArray());
		for (int i=0; i<data.length; i++){
			
			//seq 받은 값 형변환
			adminProdctVo.setProdct_seq(Integer.parseInt((data[i])));
			//배열에서 +1씩 하면 자동으로 진열 순서
			adminProdctVo.setMain_disply(i+1);
			System.out.println("Prodct_seq = " + adminProdctVo.getProdct_seq() +" && Main_disply = " + adminProdctVo.getMain_disply() + " && displyArray = "+adminProdctVo.getDisplyArray());
			
			
			getSqlSession().update("adminProdctDisplyMapper.updateMainDisplyOrdr", adminProdctVo);
		}
	}
	
	
}
