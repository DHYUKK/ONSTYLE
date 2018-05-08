package net.su.app.appCodi.service;

import java.util.List;

import net.su.consmr.codi.vo.MyDressRoomVO;


public interface AppMyDressRoomService {
	/**
	* 가상코디  옷 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  List<myDressRoomValueObject>
	* @exception  Exception
	*/
	public List<MyDressRoomVO> clothSelectList(MyDressRoomVO myDrsRmVO) throws Exception;
}

