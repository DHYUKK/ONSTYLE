package net.su.app.appCodi.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.app.appCodi.dao.AppCodiReqstDAO;
import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class AppCodiReqstServiceImpl implements AppCodiReqstService{

	@Resource	
	AppCodiReqstDAO appCodiReqstDao;
	
	//코디 요청 목록 조회
	public List<CodiReqstVO> appReqstList(CodiReqstVO reqstVO) throws Exception{
		List<CodiReqstVO> reqstList = appCodiReqstDao.appReqstList(reqstVO);
		return reqstList;
	}
	
	//코디요청 상세조회
	public CodiReqstVO appReqstRead(CodiReqstVO reqstVO) throws Exception{
		CodiReqstVO reqstInfo = appCodiReqstDao.appReqstRead(reqstVO);
		return reqstInfo;
	}
}