package net.su.app.appProdct.service;

import java.util.List;

import net.su.consmr.prodct.vo.ProdctVO;
import net.su.consmr.prodct.vo.ShpbagVO;

public interface AppProdctService {
	
	//상품 전체 조회
	public List<ProdctVO> appProdctSelect(ProdctVO prodctVO) throws Exception;
	
	//장바구니 상품 삭제
	public void deleteCartProdct(ShpbagVO shpBagVO) throws Exception;
}
