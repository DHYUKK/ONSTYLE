package net.su.app.appCodi.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.app.appCodi.dao.AppCodiShrDAO;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class AppCodiShrServiceImpl implements AppCodiShrService{

	@Resource	
	AppCodiShrDAO appCodiShrDao;
	
	   //베스트 코디 조회
	   public List<CodiShrVO> selectBestCodiShrList(CodiShrVO codiShrVO) throws Exception{
	      Logger.info("appBestCodi");
	      List<CodiShrVO> bestCodiShrList = appCodiShrDao.selectBestCodiShrList(codiShrVO);
	      
	      return bestCodiShrList;
	   }
	   
	   //전체 코디 조회
	   public List<CodiShrVO> selectCodiShrList(CodiShrVO codiShrVO) throws Exception{
	      Logger.info(null);
	      List<CodiShrVO> codiShrList = appCodiShrDao.selectCodiShrList(codiShrVO);
	      
	      return codiShrList;	
	   }
	   
	   //codiUseProdct
	   public List<CodiShrVO> codiUseProdct(CodiShrVO codiShrVO) throws Exception{
		   Logger.info(null);
		   List<CodiShrVO> codiUseProdct = appCodiShrDao.codiUseProdct(codiShrVO);
		   
		   return codiUseProdct;
	   }
	   
}