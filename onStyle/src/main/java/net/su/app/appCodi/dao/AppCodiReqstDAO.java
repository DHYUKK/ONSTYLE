package net.su.app.appCodi.dao;

import java.util.List;

import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AppCodiReqstDAO extends SqlSessionDaoSupport{

	public List<CodiReqstVO> appReqstList(CodiReqstVO reqstVO) throws Exception{
		List<CodiReqstVO> reqstList = getSqlSession().selectList("appCodiReqstMapper.appReqstList", reqstVO);
		return reqstList;
	}
	
	public CodiReqstVO appReqstRead(CodiReqstVO reqstVO) throws Exception{
		Logger.info("요청코디 상세조회");
		
		reqstVO = getSqlSession().selectOne("appCodiReqstMapper.appReqstInfo", reqstVO);
		
		if(reqstVO.getCodi_reqst_state().equals("y")){
			CodiReqstVO vo = new CodiReqstVO();
			vo = getSqlSession().selectOne("appCodiReqstMapper.appAnswrInfo", reqstVO);
			vo.setMem_img_route(reqstVO.getMem_img_route());
			vo.setMem_nicknme(reqstVO.getMem_nicknme());
			vo.setCodi_reqst_seq(reqstVO.getCodi_reqst_seq());
			vo.setCodi_reqst_state(reqstVO.getCodi_reqst_state());
			vo.setCodi_reqst_contnt(reqstVO.getCodi_reqst_contnt());
			vo.setReqstCodi_seq(reqstVO.getReqstCodi_seq());
			vo.setReqst_codi_img_route(reqstVO.getReqst_codi_img_route());
			
			return vo;
		} else{
			return reqstVO;			
		}
	}
}