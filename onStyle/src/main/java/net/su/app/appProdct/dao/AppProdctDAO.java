package net.su.app.appProdct.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.consmr.prodct.vo.ShpbagVO;
import net.su.logger.Logger;

@Repository
public class AppProdctDAO extends SqlSessionDaoSupport{
	
	//상품 전체 조회
	public List<ProdctVO> appProdctSelect(ProdctVO prodctVO) throws Exception{
		Logger.info(null);
		
		List<ProdctVO> prodctList = getSqlSession().selectList("appProdctMapper.deleteCartProdct", prodctVO);
		return prodctList;
	}
	
	//장바구니 상품 삭제
	public void deleteCartProdct(ShpbagVO shpbagVO) throws Exception{
		Logger.info(null);
		
		getSqlSession().delete("appProdctMapper.deleteCartProdct", shpbagVO);
		
	}
}
