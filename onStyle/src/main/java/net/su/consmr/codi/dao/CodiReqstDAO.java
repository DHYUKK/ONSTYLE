package net.su.consmr.codi.dao;

import java.util.ArrayList;
import java.util.List;

import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CodiReqstDAO extends SqlSessionDaoSupport{

	/**
	* 코디요청 내역 조회
	*
	* @param CodiReqstVO reqstVO
	* @return  List<CodiReqstVO>
	* @exception  Exception
	*/	
	public List<CodiReqstVO> reqstList(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 내역 조회");
		List<CodiReqstVO> reqstList = getSqlSession().selectList("codiReqstMapper.reqstList", reqstVO);
		
		return reqstList;
	}
	
	/**
	* 코디요청 내역 개수 조회
	*
	* @param CodiReqstVO reqstVO
	* @return  int
	* @exception  Exception
	*/	
	public int reqstListCount(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 내역 조회");
		int reqstListCount = getSqlSession().selectOne("codiReqstMapper.reqstListCount", reqstVO);
		
		return reqstListCount;
	}
	
	/**
	* 요청코디 상세조회
	*
	* @param CodiReqstVO reqstVO
	* @return  CodiReqstVO
	* @exception  Exception
	*/	
	public CodiReqstVO reqstRead(CodiReqstVO reqstVO) throws Exception{
		Logger.info("요청코디 상세조회");
		
		reqstVO = getSqlSession().selectOne("codiReqstMapper.reqstInfo", reqstVO);
		
		if(reqstVO.getCodi_reqst_state().equals("y")){
			CodiReqstVO vo = new CodiReqstVO();
			vo = getSqlSession().selectOne("codiReqstMapper.answrInfo", reqstVO);
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
   
	/**
	* 코디요청 삭제
	*
	* @param CodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void reqstDelete(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 삭제");
		getSqlSession().delete("codiReqstMapper.reqstDelete", reqstVO);
	}
	
	/**
	* 답변받은코디 저장
	*
	* @param CodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void answrSave(CodiReqstVO reqstVO) throws Exception{
		Logger.info("답변받은코디 저장");
		getSqlSession().update("codiReqstMapper.answrSave", reqstVO);
	}
	
	/**
	* 코디요청 수정
	*
	* @param CodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void codiReqstUpdate(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 수정");
		
		getSqlSession().update("codiReqstMapper.codiReqstUpdate", reqstVO);
	}
	
	/**
	* 코디답변 수정
	*
	* @param CodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void codiAnswrUpdate(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디답변 수정");
		
		getSqlSession().update("codiReqstMapper.codiAnswrUpdate", reqstVO);
	}
	
}