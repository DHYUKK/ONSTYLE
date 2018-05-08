package net.su.app.appCodi.dao;

import java.util.List;

import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AppCodiShrDAO extends SqlSessionDaoSupport{

	 //베스트 코디 조회
	   public List<CodiShrVO> selectBestCodiShrList(CodiShrVO codiShrVO) throws Exception {
	      Logger.info("appBestCodi");      
	      List<CodiShrVO> bestCodiShrList = getSqlSession().selectList("appCodiShrMapper.selectBestCodiShrList", codiShrVO);   
	      
	      return bestCodiShrList;
	   }
	   
	 //전체 코디 조회
	   public List<CodiShrVO> selectCodiShrList(CodiShrVO codiShrVO) throws Exception {
	      Logger.info(null);      
	      List<CodiShrVO> codiShrList = getSqlSession().selectList("appCodiShrMapper.selectCodiShrList", codiShrVO);   
	      
	      return codiShrList;
	   }
	   
	   //codiUseProdct
	   public List<CodiShrVO> codiUseProdct(CodiShrVO codiShrVO) throws Exception{
		   Logger.info(null);
		   List<CodiShrVO> codiUseProdct = getSqlSession().selectList("appCodiShrMapper.codiUseProdct", codiShrVO);
		   
		   return codiUseProdct;
	   }
	   
}