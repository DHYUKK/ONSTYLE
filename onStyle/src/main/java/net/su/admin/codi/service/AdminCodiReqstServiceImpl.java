package net.su.admin.codi.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.admin.codi.dao.AdminCodiReqstDAO;
import net.su.admin.codi.vo.AdminCodiReqstVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class AdminCodiReqstServiceImpl implements AdminCodiReqstService{

	@Resource
	private AdminCodiReqstDAO adminCodiReqstDao;
	
	/**
	* 코디요청 목록 조회
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  List<AdminCodiReqstVO>
	* @exception  Exception
	*/	
	public List<AdminCodiReqstVO> adminCodiReqstList(AdminCodiReqstVO reqstVO) throws Exception{
		Logger.info("관리자 코디요청 목록 조회");
		int codiReqstListCount = adminCodiReqstDao.codiReqstListCount(reqstVO);
		reqstVO.setTotalRecordCount(codiReqstListCount);
		List<AdminCodiReqstVO> adminCodiReqstList = adminCodiReqstDao.adminCodiReqstList(reqstVO);
		
		return adminCodiReqstList;
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
		adminCodiReqstDao.adminReqstDelete(reqstVO);
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
		
		reqstVO = adminCodiReqstDao.adminCodiReqstRead(reqstVO);
		
		return reqstVO;
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
		reqstVO = adminCodiReqstDao.codiAnswrReadInfo(reqstVO);	//수정 코디요청 멘트 조회
		
		return reqstVO;
	}
}
