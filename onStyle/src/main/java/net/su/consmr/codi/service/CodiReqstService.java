package net.su.consmr.codi.service;


import java.util.List;

import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.MyDressRoomVO;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface CodiReqstService {
	
	/**
	* 코디요청 내역 조회
	*
	* @param appCodiReqstVO reqstVO
	* @return  List<CodiReqstVO>
	* @exception  Exception
	*/	
	public List<CodiReqstVO> reqstList(CodiReqstVO reqstVO) throws Exception;
	
	/**
	* 요청코디 상세조회
	*
	* @param appCodiReqstVO reqstVO
	* @return  CodiReqstVO
	* @exception  Exception
	*/	
	public CodiReqstVO reqstRead(CodiReqstVO reqstVO) throws Exception;
	
	/**
	* 코디요청 삭제
	*
	* @param appCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void reqstDelete(CodiReqstVO reqstVO) throws Exception;
	
	/**
	* 답변받은코디 저장
	*
	* @param appCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void answrSave(CodiReqstVO reqstVO) throws Exception;
	
	/**
	* 코디요청 수정
	*
	* @param appCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void codiReqstUpdate(CodiReqstVO reqstVO) throws Exception;
	
	/**
	* 코디답변 수정
	*
	* @param appCodiReqstVO reqstVO
	* @return  
	* @exception  Exception
	*/	
	public void codiAnswrUpdate(CodiReqstVO reqstVO) throws Exception;
}

