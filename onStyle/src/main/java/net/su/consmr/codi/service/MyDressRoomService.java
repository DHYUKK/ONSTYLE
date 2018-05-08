package net.su.consmr.codi.service;

import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface MyDressRoomService {
	/**
	* 가상코디  옷 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  List<myDressRoomValueObject>
	* @exception  Exception
	*/
	public List<MyDressRoomVO> clothSelect(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 선택한 옷 정보 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  myDressRoomValueObject
	* @exception  Exception
	*/
	public MyDressRoomVO clothRead(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 나의 옷 등록
	*
	* @param MultipartHttpServletRequest request, myDressRoomValueObject myDrsRmVO
	* @return
	* @exception  Exception
	*/
	public void myClothInsert(MultipartHttpServletRequest request, MyDressRoomVO myDrsRmVO) throws Exception;
//	public void myClothInsert(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 나의 옷 마지막 seq조회
	*
	* @param 
	* @return int
	* @exception  Exception
	*/
	public int myClothMaxSeqSelect() throws Exception;
	
	/**
	* 코디 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  List<myDressRoomValueObject>
	* @exception  Exception
	*/
	public List<MyDressRoomVO> codiList(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 코디 공유
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return	CodiShrVO
	* @exception  Exception
	*/
	public CodiShrVO shrCodi(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 스크랩취소
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exception  Exception
	*/
	public void scrapCancel(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 코디 삭제
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exception  Exception
	*/
	public void deleteCodi(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 코디 및 회원 정보 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  myDressRoomValueObject
	* @exception  Exception
	*/
	public MyDressRoomVO codiInfo(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 코디에 사용된 상품 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  List<myDressRoomValueObject>
	* @exception  Exception
	*/
	public List<MyDressRoomVO> codiRead(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 코디테이블 MAX(SEQ)
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exception  Exception
	*/
	public int codiMaxSeq() throws Exception;
	
	/**
	* 코디 저장
	*
	* @param myDressRoomValueObject vo
	* @return
	* @exception  Exception
	*/
	public void insertCodi(MyDressRoomVO vo) throws Exception;
	
	/**
	* 코디에 사용된 옷 등록
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exception  Exception
	*/
	public void insertCodiUsedCloth(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 나의 코디에 사용된 옷 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @return  List<myDressRoomValueObject>
	* @exception  Exception
	*/
	public List<MyDressRoomVO> usedClothList(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 코디에 사용된 옷 삭제
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exception  Exception
	*/
	public void deleteUsedCloth(MyDressRoomVO myDrsRmVO) throws Exception;
	
	/**
	* 수정한 코디 업데이트
	*
	* @param myDressRoomValueObject vo
	* @return
	* @exception  Exception
	*/
	public void updateCodi(MyDressRoomVO vo) throws Exception;
	
	/**
	* 코디요청 등록 메서드	
	*
	* @param CodiReqstVO reqstVO
	* @return
	* @exception  Exception
	*/
	public void insertReqst(CodiReqstVO reqstVO) throws Exception;
	
	/**
	* 코디답변 등록 메서드
	*
	* @param myDressRoomValueObject vo
	* @return
	* @exception  Exception
	*/
	public void insertAnswr(CodiReqstVO reqstVO) throws Exception;
	
	/**
	* 수정 코디요청 멘트 조회
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return	CodiReqstVO
	* @exception  Exception
	*/
	public CodiReqstVO codiReqstReadInfo(MyDressRoomVO myDrsRmVO) throws Exception;
	
	
//정우 추가
	//나의 옷장 조회
	public List<MyDressRoomVO> appMyDressRoomSelectList(MyDressRoomVO myDrsRmVO) throws Exception;
}

