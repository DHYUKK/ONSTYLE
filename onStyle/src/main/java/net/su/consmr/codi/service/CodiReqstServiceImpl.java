package net.su.consmr.codi.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.common.security.PageVO;
import net.su.consmr.codi.dao.CodiReqstDAO;
import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class CodiReqstServiceImpl implements CodiReqstService{

	@Resource	
	CodiReqstDAO codiReqstDao;
	
	MemVO memVO = new MemVO();

	/**
	* 코디요청 내역 조회
	*
	* @param CodiReqstVO reqstVO
	* @return  List<CodiReqstVO>
	* @exception  Exception
	*/	
	public List<CodiReqstVO> reqstList(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 내역 조회");
		int reqstListCount = codiReqstDao.reqstListCount(reqstVO);
		reqstVO.setTotalRecordCount(reqstListCount);
		List<CodiReqstVO> reqstList = codiReqstDao.reqstList(reqstVO);	//코디요청 내역 조회
		
		return reqstList;
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
		reqstVO = codiReqstDao.reqstRead(reqstVO);
		
		return reqstVO;
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
		codiReqstDao.reqstDelete(reqstVO);
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
		
		codiReqstDao.answrSave(reqstVO);

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
		
		codiReqstDao.codiReqstUpdate(reqstVO);
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
		
		codiReqstDao.codiAnswrUpdate(reqstVO);
	}
}