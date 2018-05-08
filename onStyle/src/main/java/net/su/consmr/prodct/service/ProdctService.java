package net.su.consmr.prodct.service;

import java.util.List;

import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.consmr.prodct.vo.ShpbagVO;

public interface ProdctService {
	//상품 전체 조회
	public List<ProdctVO> prodctSelect(ProdctVO prodctVO) throws Exception;
	//상품 상세조회
	public ProdctVO prodctView(ProdctVO prodctVO) throws Exception;
	//상품 색상 조회
	public List<ProdctVO> selectProdctColor(ProdctVO prodctVO) throws Exception;
	//상품 사이즈 조회
	public List<ProdctVO> selectProdctSize(ProdctVO prodctVO) throws Exception;
	//장바구니 조회
	public List<ShpbagVO> crtselect(ShpbagVO shpbagvo) throws Exception;
	//장바구니 삭제
	public void deletes(ShpbagVO shpbagvo) throws Exception;
	//베스트 상품 코디 조회
	public CodiShrVO selectProdctBestCodi(CodiShrVO codiShrVO) throws Exception;
	//장바구니 담기
	public void cartInsert(ShpbagVO shpbagVO) throws Exception;
	
}

