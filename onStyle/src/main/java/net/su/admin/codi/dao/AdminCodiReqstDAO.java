package net.su.admin.codi.dao;

import java.util.List;

import net.su.admin.codi.vo.AdminCodiReqstVO;
import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCodiReqstDAO extends SqlSessionDaoSupport{
	/**
	* 코디요청 목록 조회
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  List<AdminCodiReqstVO>
	* @exception  Exception
	*/	
	public List<AdminCodiReqstVO> adminCodiReqstList(AdminCodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 목록 조회");
		
		List<AdminCodiReqstVO> adminCodiReqstList = getSqlSession().selectList("adminCodiReqstMapper.adminCodiReqstList", reqstVO);

		return adminCodiReqstList;
	}
	
	/**
	* 코디요청 목록 개수 조회
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  int
	* @exception  Exception
	*/	
	public int codiReqstListCount(AdminCodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 목록 개수 조회");

		int codiReqstListCount = getSqlSession().selectOne("adminCodiReqstMapper.codiReqstListCount", reqstVO);
		
		return codiReqstListCount;
	}
	
	/**
	* 관리자 코디요청 삭제
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void adminReqstDelete(AdminCodiReqstVO reqstVO) throws Exception{
		Logger.info("관리자 코디요청 삭제");
		getSqlSession().delete("adminCodiReqstMapper.adminReqstDelete", reqstVO);
	}
	
	/**
	* 관리자 코디요청 상세보기
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public AdminCodiReqstVO adminCodiReqstRead(AdminCodiReqstVO reqstVO) throws Exception{
		Logger.info("관리자 코디요청 상세보기");
		
		reqstVO = getSqlSession().selectOne("adminCodiReqstMapper.reqstInfo", reqstVO);
		
		if(reqstVO.getCodi_reqst_state().equals("y")){
			
			AdminCodiReqstVO vo = new AdminCodiReqstVO();
			
			vo = getSqlSession().selectOne("adminCodiReqstMapper.answrInfo", reqstVO);
			
			vo.setMem_seq(reqstVO.getMem_seq());
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
	* 답변 코디 수정 페이지
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public AdminCodiReqstVO codiAnswrReadInfo(AdminCodiReqstVO reqstVO) throws Exception{
		Logger.info("답변 코디 수정 페이지");
		reqstVO = getSqlSession().selectOne("adminCodiReqstMapper.codiAnswrReadInfo", reqstVO);
		
		return reqstVO;
	}
}
