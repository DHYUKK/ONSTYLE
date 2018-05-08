package net.su.app.appCodi.dao;

import java.util.List;

import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AppMyDressRoomDAO extends SqlSessionDaoSupport{
	
	/**	
	 * 가상코디 옷 조회
	 *
	 * @param MyDressRoomVO
	 * @return  List<MyDressRoomVO>
	 * @exception  Exception
	 */		
	public List<MyDressRoomVO> clothSelectList(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("옷 조회");
		List<MyDressRoomVO> clothSelectList;
		
		String bigGroup = myDrsRmVO.getBigGroup();
		if(bigGroup.equals("myCloth")){
			clothSelectList = getSqlSession().selectList("appMyDressRoomMapper.myCloth", myDrsRmVO);
		} else{
			clothSelectList = getSqlSession().selectList("appMyDressRoomMapper.prodct", myDrsRmVO);
		}
		Logger.info("켈룩켈룩켈룩켈룩");

		return clothSelectList;
	}
	
}