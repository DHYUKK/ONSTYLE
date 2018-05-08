package net.su.app.appCodi.service;

import java.util.List;




import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.app.appCodi.dao.AppMyDressRoomDAO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;


@Service
public class AppMyDressRoomServiceImpl implements AppMyDressRoomService{

	@Resource
	AppMyDressRoomDAO appMyDressRoomDao;
	
	/**
	* 가상코디  옷 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  List<myDressRoomValueObject>
	* @exception  Exception
	*/
	public List<MyDressRoomVO> clothSelectList(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("APP 옷 조회");
		List<MyDressRoomVO> clothSelectList = appMyDressRoomDao.clothSelectList(myDrsRmVO);
		Logger.info("켈룩켈룩켈룩켈룩");

		return clothSelectList;

	}
	
}