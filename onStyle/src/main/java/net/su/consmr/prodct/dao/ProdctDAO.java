package net.su.consmr.prodct.dao;

import java.util.List;

import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.consmr.prodct.vo.ShpbagVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ProdctDAO extends SqlSessionDaoSupport{
	
//장바구니 조회
	public List<ShpbagVO> crtselect(ShpbagVO shpbagvo) throws Exception{
		Logger.info("장바구니 조회");
		List<ShpbagVO> shpbagList = getSqlSession().selectList("consmrProdctMapper.crtselect", shpbagvo);
		return shpbagList;
	}
//  상품 색상조회
	public List<ProdctVO> selectProdctColor(ProdctVO prodctVO) throws Exception{
		Logger.info("상품색상 조회");
		List<ProdctVO> prodctColorList = getSqlSession().selectList("consmrProdctMapper.selectProdctColor", prodctVO);
		return prodctColorList;
	}
//상품 상세보기 조회
	public ProdctVO prodctView(ProdctVO prodctVO) throws Exception{
		Logger.info("상품상세 조회");
		prodctVO = getSqlSession().selectOne("consmrProdctMapper.prodctView", prodctVO);
		return prodctVO;
	}
//상품 전체 조회
	public List<ProdctVO> prodctSelect(ProdctVO prodctVO) throws Exception{
		Logger.info("상품 조회");
		List<ProdctVO> prodctList = getSqlSession().selectList("consmrProdctMapper.prodctSelect", prodctVO);
		return prodctList;
	}
//상품 사이즈 조회	
	public List<ProdctVO> selectProdctSize(ProdctVO prodctVO) throws Exception{
		Logger.info("상품 조회");
		List<ProdctVO> prodctSizeList = getSqlSession().selectList("consmrProdctMapper.selectProdctSize", prodctVO);
		return prodctSizeList;
	}
// 장바구니 삭제
	public void deletes(ShpbagVO shpbagvo) throws Exception{
		getSqlSession().delete("consmrProdctMapper.deletes", shpbagvo);
	}
	//베스트 상품 조회
	public CodiShrVO selectProdctBestCodi(CodiShrVO codiShrVO) throws Exception{
		Logger.info("상품 사이즈 회");
		codiShrVO = getSqlSession().selectOne("consmrProdctMapper.selectProdctBestCodi", codiShrVO);
		return codiShrVO;
	
	}
	//장바구니 담기
	public void cartInsert(ShpbagVO shpbagVO) throws Exception{
		Logger.info("상품 사이즈 회");
		getSqlSession().insert("consmrProdctMapper.cartInsert", shpbagVO);
	
	
	}
}

