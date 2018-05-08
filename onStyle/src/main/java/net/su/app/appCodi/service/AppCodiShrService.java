package net.su.app.appCodi.service;

import java.util.List;

import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;

public interface AppCodiShrService {

	   //코공게 베스트 조회
	   public List<CodiShrVO> selectBestCodiShrList(CodiShrVO codiShrVO) throws Exception;

	   //코공게 전체 조회
	   public List<CodiShrVO> selectCodiShrList(CodiShrVO codiShrVO) throws Exception;
	   
	   //codiUseProdct
	   public List<CodiShrVO> codiUseProdct(CodiShrVO codiShrVO) throws Exception;
}

