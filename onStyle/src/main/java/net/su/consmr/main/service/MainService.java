package net.su.consmr.main.service;

import java.util.List;

import net.su.consmr.prodct.vo.ProdctVO;

public interface MainService {
	/**
	* 메인 진열 상품 조회
	*
	* @param  
	* @return  List<ProdctVO>
	* @exception  Exception
	*/	
	public List<ProdctVO> mainProdctSelect()  throws Exception;
}
