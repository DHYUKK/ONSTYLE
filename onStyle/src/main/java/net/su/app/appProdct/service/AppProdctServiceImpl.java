package net.su.app.appProdct.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.app.appProdct.service.AppProdctService;
import net.su.app.appProdct.dao.AppProdctDAO;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.consmr.prodct.vo.ShpbagVO;
import net.su.logger.Logger;

@Service
public class AppProdctServiceImpl implements AppProdctService{

	@Resource	
	AppProdctDAO appProdctDao;
	
	//상품 전체 조회
	public List<ProdctVO> appProdctSelect(ProdctVO prodctVO) throws Exception{
		Logger.info("app 상품 조회, "+prodctVO.getCategory_seq());
		
		List<ProdctVO> prodctList = appProdctDao.appProdctSelect(prodctVO);
		return prodctList;
	}
	
	//장바구니 상품 삭제
	public void deleteCartProdct(ShpbagVO shpBagVO) throws Exception{
		Logger.info(null);
		appProdctDao.deleteCartProdct(shpBagVO);
	}
	

}
