package net.su.admin.codi.service;

import java.util.List;

import net.su.admin.codi.vo.AdminCodiReqstVO;

public interface AdminCodiReqstService {
	
	/**
	* 코디요청 목록 조회
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  List<AdminCodiReqstVO>
	* @exception  Exception
	*/	
	public List<AdminCodiReqstVO> adminCodiReqstList(AdminCodiReqstVO reqstVO) throws Exception;
	
	/**
	* 코디요청 삭제
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void adminReqstDelete(AdminCodiReqstVO reqstVO) throws Exception;
	
	/**
	* 관리자 코디요청 상세보기
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public AdminCodiReqstVO adminCodiReqstRead(AdminCodiReqstVO reqstVO) throws Exception;
	
	/**
	* 답변 코디 수정 페이지
	*
	* @param AdminCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public AdminCodiReqstVO codiAnswrReadInfo(AdminCodiReqstVO reqstVO) throws Exception;
}
