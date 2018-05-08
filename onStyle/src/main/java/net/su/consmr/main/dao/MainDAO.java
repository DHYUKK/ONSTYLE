package net.su.consmr.main.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.consmr.prodct.vo.ProdctVO;
import net.su.logger.Logger;

@Repository
public class MainDAO extends SqlSessionDaoSupport{
	
	/**
	* 메인 진열 상품 조회
	*
	* @param ProdctVO prodctVO
	* @return  List<ProdctVO>
	* @exception  Exception
	*/	
	public List<ProdctVO> mainProdctSelect()  throws Exception{
		Logger.info("메인 진열 상품 조회");
		
		List<ProdctVO> mainProdctSelect = getSqlSession().selectList("consmrMainMapper.mainProdctSelect");
		return mainProdctSelect;
	}
}
