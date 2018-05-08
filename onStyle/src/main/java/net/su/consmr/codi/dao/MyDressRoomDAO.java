package net.su.consmr.codi.dao;

import java.util.ArrayList;
import java.util.List;

import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MyDressRoomDAO extends SqlSessionDaoSupport{
	
	/**	
	 * 가상코디 옷 조회
	 *
	 * @param MyDressRoomVO
	 * @return  List<MyDressRoomVO>
	 * @exception  Exception
	 */		
	public List<MyDressRoomVO> clothSelect(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("옷 조회");
		List<MyDressRoomVO> clothSelect;
		
		String bigGroup = myDrsRmVO.getBigGroup();
		if(bigGroup.equals("myCloth")){
		clothSelect = getSqlSession().selectList("myDressRoomMapper.myClothSelect", myDrsRmVO);
		} else{
		clothSelect = getSqlSession().selectList("myDressRoomMapper.prodctSelect", myDrsRmVO);
		}
		return clothSelect;
	}
	
	/**
	* 나의 옷 개수 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  int
	* @exception  Exception
	*/	
	public int clothSeletCount(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("나의 옷 개수 조회");
		int clothSelectount;
		String bigGroup = myDrsRmVO.getBigGroup();
		if(bigGroup.equals("myCloth")){
			clothSelectount = getSqlSession().selectOne("myDressRoomMapper.myClothSelectCount", myDrsRmVO);
		} else{
			clothSelectount = getSqlSession().selectOne("myDressRoomMapper.prodctSelectCount", myDrsRmVO);
		}
		
		return clothSelectount;
	}
	
	/**
	 * 선택한 옷 정보 조회
	 *
	 * @param MyDressRoomVO
	 * @return  MyDressRoomVO
	 * @exception  Exception
	 */
	public MyDressRoomVO clothRead(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("선택한 옷 정보 조회");
		MyDressRoomVO clothRead = new MyDressRoomVO();
		
		String bigGroup = myDrsRmVO.getBigGroup();
		if(bigGroup.equals("myCloth")){
			clothRead = getSqlSession().selectOne("myDressRoomMapper.myClothRead", myDrsRmVO);
		} else if(bigGroup.equals("prodct")){
			clothRead = getSqlSession().selectOne("myDressRoomMapper.prodctClothRead", myDrsRmVO);
		}
		
		
		return clothRead;
	}
	
	/**
	 * 이미지이름에 필요한 mycloth_tb MAX(mycloth_Seq)값 가져오기
	 *
	 * @param MyDressRoomVO
	 * @return  MyDressRoomVO
	 * @exception  Exception
	 */
	public int myClothMaxSeqSelect() throws Exception{
		MyDressRoomVO myDrsRmVO = new MyDressRoomVO();
		
		myDrsRmVO = getSqlSession().selectOne("myDressRoomMapper.myClothMaxSeqSelect");
		int myClothMaxSeqSelect = myDrsRmVO.getMyCloth_seq();
		
		return myClothMaxSeqSelect;
	}
	
	/**
	 * 이미지 등록
	 *
	 * @param MyDressRoomVO
	 * @return  void
	 * @exception 
	 */
	public void myClothInsert(MyDressRoomVO myDrsRmVO) {
		Logger.info("나의 옷 등록");
		getSqlSession().insert("myDressRoomMapper.myClothInsert", myDrsRmVO);
	}
	
	/**
	 * 코디 조회
	 *
	 * @param MyDressRoomVO
	 * @return  List<MyDressRoomVO>
	 * @exception  Exception
	 */
	public List<MyDressRoomVO> codiList(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디 조회");
		List<MyDressRoomVO> codiList;
		
		codiList = getSqlSession().selectList("myDressRoomMapper.codiList", myDrsRmVO);
		return codiList;
	}
	
	/**
	 * 나의 코디 개수 조회
	 *
	 * @param MyDressRoomVO
	 * @return  List<MyDressRoomVO>
	 * @exception  Exception
	 */
	public int codiListCount(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("나의 코디 개수 조회");
		int reqstListCount = getSqlSession().selectOne("myDressRoomMapper.codiListCount", myDrsRmVO);

		return reqstListCount;
	}
	
	/**
	  * 코디 공유
	  *
	  * @param MyDressRoomVO myDrsRmVO
	  * @return
	  * @exception  Exception
	  */
	 public CodiShrVO shrCodi(MyDressRoomVO myDrsRmVO){
		Logger.info("코디 공유");
		CodiShrVO codiShrVO = new CodiShrVO();

		getSqlSession().insert("myDressRoomMapper.shrCodi", myDrsRmVO);
		
		if(myDrsRmVO.getLocation()==1){
		codiShrVO = getSqlSession().selectOne("myDressRoomMapper.selectCodiShrSeq", myDrsRmVO);
		}
		return codiShrVO;
	 }
	
	 /**
	  * 스크랩취소
	  *
	  * @param myDressRoomValueObject myDrsRmVO
	  * @return
	  * @exception  Exception
	  */
	 public void scrapCancel(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("스크랩취소");
		  
		getSqlSession().delete("myDressRoomMapper.scrapCancel", myDrsRmVO);
	 }
	/**
	  * 코디 삭제
	  *
	  * @param MyDressRoomVO myDrsRmVO
	  * @return
	  * @exception  Exception
	  */
	public void deleteCodi(MyDressRoomVO myDrsRmVO) {
		Logger.info("코디 삭제");
		System.out.println("확인한다! : "+myDrsRmVO.getLocation());
		getSqlSession().delete("myDressRoomMapper.deleteCodi", myDrsRmVO);
	}
	
	/**
	 * 코디 및 회원 정보 조회
	 *
	 * @param MyDressRoomVO
	 * @return  MyDressRoomVO
	 * @exception  Exception
	 */
	public MyDressRoomVO codiInfo(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디 및 회원 정보 조회getCodi_seq()"+myDrsRmVO.getCodi_seq());
		MyDressRoomVO codiInfo = getSqlSession().selectOne("myDressRoomMapper.codiInfo",myDrsRmVO);
		
		return codiInfo;
	}
	
	/**
	  * 코디에 사용된 상품 조회
	  *
	  * @param MyDressRoomVO myDrsRmVO
	  * @return  List<MyDressRoomVO>
	  * @exception  Exception
	  */
	 public List<MyDressRoomVO> codiRead(MyDressRoomVO myDrsRmVO) throws Exception{
		 Logger.info("코디에 사용된 상품 조회");
		 List<MyDressRoomVO> codiRead = getSqlSession().selectList("myDressRoomMapper.codiRead",myDrsRmVO);
		 return codiRead;
	 }
	 
	 /**
	  * 코디테이블 MAX(SEQ)
	  *
	  * @param
	  * @return	int
	  * @exception  Exception
	  */
	 public int codiMaxSeq(){
		 Logger.info("코디테이블 MAX(SEQ) 조회");
		 MyDressRoomVO myDrsRmVO = new MyDressRoomVO();

		 myDrsRmVO = getSqlSession().selectOne("myDressRoomMapper.codiMaxSeq");
		 int codiMaxSeq = myDrsRmVO.getCodi_seq();

		 return codiMaxSeq;
	 }
	 
	 /**
	  * 코디 저장
	  *
	  * @param MyDressRoomVO vo
	  * @return
	  * @exception  Exception
	  */
	 public void insertCodi(MyDressRoomVO vo){
		 Logger.info("코디 저장");
		 getSqlSession().insert("myDressRoomMapper.insertCodi", vo);
	 }
	 
	 /**
	  * 코디에 사용된 옷 등록
	  *
	  * @param MyDressRoomVO myDrsRmVO
	  * @return
	  * @exception  Exception
	  */
	 public void insertCodiUsedCloth(MyDressRoomVO myDrsRmVO){
		 Logger.info("코디에 사용된 옷 등록");
		 List<MyDressRoomVO> list = new ArrayList<MyDressRoomVO>();
	  
		 List<String> canvas_img_seq = myDrsRmVO.getCanvas_img_seq();
		 List<String> codi_use_xpoint = myDrsRmVO.getXpoint_list();
		 List<String> codi_use_ypoint = myDrsRmVO.getYpoint_list();
		 List<String> codi_use_width = myDrsRmVO.getWidth_list();
		 
		 for(int i=0;i<canvas_img_seq.size();i++){
	 		MyDressRoomVO vo = new MyDressRoomVO();
	 		String code = canvas_img_seq.get(i).substring(0,1);
	 		
	 		String x = codi_use_xpoint.get(i);
	 		String y = codi_use_ypoint.get(i);
	 		String width = codi_use_width.get(i);
	 		
	 		if(code.equals("m")){
	 			int mycloth_seq = Integer.parseInt(canvas_img_seq.get(i).substring(1));
	 			vo.setMyCloth_seq(mycloth_seq);
	 			vo.setProdct_seq(null);
	 		} else if(code.equals("p")){
	 			int prodct_seq = Integer.parseInt(canvas_img_seq.get(i).substring(1));
	 			vo.setProdct_seq(prodct_seq);
	 			vo.setMyCloth_seq(null);
	 		}
	 		vo.setCodi_use_xpoint(x);
	 		vo.setCodi_use_ypoint(y);
	 		vo.setCodi_use_width(width);
	 		vo.setCodi_use_sort(i);
	 		vo.setCodi_seq(myDrsRmVO.getCodi_seq());
	 		list.add(vo);
		 }

		 getSqlSession().insert("myDressRoomMapper.insertCodiUsedCloth", list);
	 }
	 
	 /**
	  * 나의 코디에 사용된 옷 조회
	  *
	  * @param MyDressRoomVO myDrsRmVO
	  * @return  List<myDressRoomValueObject>
	  * @exception  Exception
	  */
	 public List<MyDressRoomVO> usedClothList(MyDressRoomVO myDrsRmVO) throws Exception{
	 	Logger.info("나의 코디에 사용된 옷 조회");
	 	
	 	List<MyDressRoomVO> usedClothList = getSqlSession().selectList("myDressRoomMapper.usedClothList",myDrsRmVO);
	 	
	 	return usedClothList;
	 }
	 
	 /**
	  * 수정한 코디 업데이트
	  *
	  * @param myDressRoomValueObject vo
	  * @return
	  * @exception  Exception
	  */
	 public void updateCodi(MyDressRoomVO vo) throws Exception{
	 	Logger.info("수정한 코디 업데이트");
	 	getSqlSession().update("myDressRoomMapper.updateCodi",vo);
	 }
	 
	 /**
	  * 코디에 사용된 옷 삭제
	  *
	  * @param myDressRoomValueObject myDrsRmVO
	  * @return
	  * @exception  Exception
	  */
	 public void deleteUsedCloth(MyDressRoomVO myDrsRmVO) throws Exception{
	 	Logger.info("코디에 사용된 옷 삭제");
	 	getSqlSession().delete("myDressRoomMapper.deleteUsedCloth",myDrsRmVO);
	 }
	 
	 /**
	* 코디요청 등록 메서드
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public void insertReqst(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디요청 등록 메서드");
	 	getSqlSession().insert("codiReqstMapper.insertReqst",reqstVO);
	}
	
	/**
	* 코디답변 등록 메서드
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public void insertAnswr(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디답변 등록 메서드");
	 	getSqlSession().insert("codiReqstMapper.insertAnswr",reqstVO);
	}
	
	/**
	* 코디요청상태 변경 n -> y
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public void updateReqstState(CodiReqstVO reqstVO) throws Exception{
		Logger.info("코디답변 등록 메서드");
	 	getSqlSession().update("codiReqstMapper.updateReqstState",reqstVO);
	}
	
	/**
	* 수정 코디요청 멘트 조회
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return	CodiReqstVO
	* @exception  Exception
	*/
	public CodiReqstVO codiReqstReadInfo(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("수정 코디요청 멘트 조회");

		CodiReqstVO reqstVO = new CodiReqstVO();

		reqstVO = getSqlSession().selectOne("codiReqstMapper.codiReqstReadInfo", myDrsRmVO);

		return reqstVO;
	}
	
	
//정우 추가
	//나의 옷장 조회
	public List<MyDressRoomVO> appMyDressRoomSelectList(MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("나의 옷장 조회");
		
		return getSqlSession().selectList("myDressRoomMapper.appMyDressRoomSelectList",myDrsRmVO);
	}
}