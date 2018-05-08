package net.su.consmr.main.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import net.su.logger.Logger;

import net.su.consmr.main.dao.MainDAO;
import net.su.consmr.prodct.vo.ProdctVO;

@Service
public class MainServiceImpl {
	
	@Resource
	MainDAO mainDao;
	
	/**
	* 메인 진열 상품 조회
	*
	* @param ProdctVO prodctVO
	* @return  List<ProdctVO>
	* @exception  Exception
	*/	
	public List<ProdctVO> mainProdctSelect()  throws Exception{
		Logger.info("메인 진열 상품 조회");
		
		List<ProdctVO> mainProdctSelect = mainDao.mainProdctSelect();
		return mainProdctSelect;
	}
}
