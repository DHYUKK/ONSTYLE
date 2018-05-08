package net.su.app.appCodi.service;

import java.util.List;

import net.su.consmr.codi.vo.CodiReqstVO;

public interface AppCodiReqstService {

	public List<CodiReqstVO> appReqstList(CodiReqstVO reqstVO) throws Exception; //코디 요청 목록 조회
	
	public CodiReqstVO appReqstRead(CodiReqstVO reqstVO) throws Exception;	//코디요청 상세조회
}
