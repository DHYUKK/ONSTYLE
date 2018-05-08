package net.su.consmr.prodct.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.prodct.dao.ProdctDAO;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.consmr.prodct.vo.ShpbagVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class ProdctServiceImpl implements ProdctService{
	
	@Resource
	ProdctDAO prodctDAO;
	
	public List<ProdctVO> selectProdctColor(ProdctVO prodctVO) throws Exception{
		Logger.info("");
		List<ProdctVO> prodctColorList = prodctDAO.selectProdctColor(prodctVO);
		return prodctColorList;
	}
//상품 전체 조회
	public List<ProdctVO> prodctSelect(ProdctVO prodctVO) throws Exception{
		Logger.info("");
		List<ProdctVO> prodctList = prodctDAO.prodctSelect(prodctVO);
		return prodctList;
	}
	public ProdctVO prodctView(ProdctVO prodctVO) throws Exception{
		
		prodctVO = prodctDAO.prodctView(prodctVO);
		return prodctVO;
	}
	public List<ProdctVO> selectProdctSize(ProdctVO prodctVO) throws Exception{
		Logger.info("");
		List<ProdctVO> prodctSizeList = prodctDAO.selectProdctSize(prodctVO);
		return prodctSizeList;
	
	}
// 장바구니 조회
	public List<ShpbagVO> crtselect(ShpbagVO shpbagvo) throws Exception{
		Logger.info("장바구니 조회");
		List<ShpbagVO> shpbagList = prodctDAO.crtselect(shpbagvo);
		return shpbagList;
	}
// 장바구니 삭제
	public void deletes(ShpbagVO shpbagvo) throws Exception{
		Logger.info("장바구니 삭제");
		prodctDAO.deletes(shpbagvo);
	}
	
	public CodiShrVO selectProdctBestCodi(CodiShrVO codiShrVO) throws Exception{
		Logger.info("상품 사이즈 회");
		codiShrVO = prodctDAO.selectProdctBestCodi(codiShrVO);
		return codiShrVO;

	}
	public void cartInsert(ShpbagVO shpbagVO) throws Exception{
		Logger.info("장바구니 담기");
		prodctDAO.cartInsert(shpbagVO);
	}
}
