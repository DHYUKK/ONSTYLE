package net.su.consmr.codi.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import net.su.consmr.codi.dao.MyDressRoomDAO;
import net.su.consmr.codi.vo.CodiReqstVO;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class MyDressRoomServiceImpl implements MyDressRoomService{

	@Resource
	MyDressRoomDAO myDrsRmDao;
	
	MemVO memVO = new MemVO();	
	
	/**
	 * 가상코디 옷 조회
	 *
	 * @param MyDressRoomVO
	 * @returnList<myDressRoomValueObject>
	 * @exceptionException
	 */
	public List<MyDressRoomVO> clothSelect(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("나의 옷 조회");
		
		myDrsRmVO.setRecordCountPerPage(24);

		int clothSeletCount = myDrsRmDao.clothSeletCount(myDrsRmVO);
		myDrsRmVO.setTotalRecordCount(clothSeletCount);

		List<MyDressRoomVO> clothSelect = myDrsRmDao.clothSelect(myDrsRmVO);

		return clothSelect;
	}
	
	/**
	* 선택한 옷 정보 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @returnmyDressRoomValueObject
	* @exceptionException
	*/
	public MyDressRoomVO clothRead(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("선택한 옷 정보 조회");

		MyDressRoomVO clothRead = myDrsRmDao.clothRead(myDrsRmVO);
		
		return clothRead;
	}
	
	/**
	* 나의 옷 등록
	*
	* @param MyDressRoomVO myDrsRmVO
	* @returnmyDressRoomValueObject
	* @exceptionException
	*/
	public void myClothInsert(MultipartHttpServletRequest request, MyDressRoomVO myDrsRmVO) throws Exception{
//	public void myClothInsert(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("나의 옷 등록");
		myDrsRmVO.setMyCloth_seq((myDrsRmDao.myClothMaxSeqSelect())+1);
				
	 		//이미지 관련
			MyDressRoomServiceImpl myDrsRmServiceImpl = new MyDressRoomServiceImpl();
			Map<String, MultipartFile> files = request.getFileMap();	 
			CommonsMultipartFile getEvntImgCmf = (CommonsMultipartFile) files.get("myCloth_src");
			ServletContext context = request.getSession().getServletContext();
			if(getEvntImgCmf!=null)
			{
				String filePath ="/resources/consmr/codi/myDressRoom/img/myCloth/myCloth"+myDrsRmVO.getMyCloth_seq()+".png";
				String dirPath ="/resources/consmr/codi/myDressRoom/img/myCloth";
				myDrsRmVO.setMyCloth_img_route(filePath);
				myDrsRmServiceImpl.myClothImgSave(context.getRealPath(filePath), context.getRealPath(dirPath), getEvntImgCmf);
			}
		//나의 옷 등록
		myDrsRmDao.myClothInsert(myDrsRmVO);
		
	}
	
	/**
	* myCloth_tb 마지막 seq조회
	*
	* @param 
	* @return int
	* @exception  Exception
	*/
	public int myClothMaxSeqSelect() throws Exception{
		Logger.info("myCloth_tb 마지막 seq조회");
		int myClothMaxSeqSelect = myDrsRmDao.myClothMaxSeqSelect();
		return myClothMaxSeqSelect;
	}
	
	/**
	* 옷 이미지 저장 
	*
	* @param MyDressRoomVO myDrsRmVO
	* @returnmyDressRoomValueObject
	* @exceptionException
	*/
	public void myClothImgSave(String filePath, String dirPath, CommonsMultipartFile cmf) throws Exception
	{
		Logger.info("옷 이미지 저장");
		File fileSaver = new File(filePath);
		File dirSaver = new File(dirPath);
		// 파일 업로드 처리 완료.
		try {
			if(!fileSaver.exists())
			{
				dirSaver.mkdir();
			}
			cmf.transferTo(fileSaver);
			System.out.println("성공");
		 } catch (Exception e) {
		 	System.out.println("실패: "+ e);
		 }
	}
	 
	/**
	* 코디 조회
	*
	* @param MyDressRoomVO
	* @returnList<myDressRoomValueObject>
	* @exceptionException
	*/
	public List<MyDressRoomVO> codiList(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디 조회");
		int codiListCount = myDrsRmDao.codiListCount(myDrsRmVO);
		myDrsRmVO.setTotalRecordCount(codiListCount);
		System.out.println("총 페이지 수  ::  "+myDrsRmVO.getTotalPageCount());
		List<MyDressRoomVO> codiList = myDrsRmDao.codiList(myDrsRmVO);
	
		return codiList;
	}
	 
	/**
	* 코디 공유
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public CodiShrVO shrCodi(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디 공유");
		CodiShrVO codiShrVO = new CodiShrVO();
	
		codiShrVO = myDrsRmDao.shrCodi(myDrsRmVO);
			 
		return codiShrVO;
	}
	 
	/**
	* 스크랩취소
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public void scrapCancel(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("스크랩취소");
	
		myDrsRmDao.scrapCancel(myDrsRmVO);

	}
	 
	/**
	* 코디 삭제
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public void deleteCodi(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디 삭제");
		myDrsRmDao.deleteCodi(myDrsRmVO);
	}
	 
	/**
	* 코디 및 회원 정보 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @returnmyDressRoomValueObject
	* @exceptionException
	*/
	public MyDressRoomVO codiInfo(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디 및 회원 정보 조회");
		Logger.info("코디 및 회원 정보 조회getCodi_seq()"+myDrsRmVO.getCodi_seq());
		MyDressRoomVO codiInfo = myDrsRmDao.codiInfo(myDrsRmVO);
		return codiInfo;
	}
	 
	/**
	* 코디에 사용된 상품 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @returnList<myDressRoomValueObject>
	* @exceptionException
	*/
	public List<MyDressRoomVO> codiRead(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디에 사용된 상품 조회");
	 
		List<MyDressRoomVO> codiRead = myDrsRmDao.codiRead(myDrsRmVO);
		return codiRead;
	}
	 
	/**
	* 코디테이블 MAX(SEQ)
	*
	* @param
	* @return	int
	* @exceptionException
	*/
	public int codiMaxSeq() throws Exception{
		Logger.info("코디테이블 MAX(SEQ) 조회");
		int codiMaxSeq = myDrsRmDao.codiMaxSeq();
		
	 	return codiMaxSeq;
	}
	
	/**
	* 코디 저장
	*
	* @param myDressRoomValueObject vo
	* @return
	* @exceptionException
	*/
	public void insertCodi(MyDressRoomVO vo) throws Exception{
		Logger.info("코디 저장");
		myDrsRmDao.insertCodi(vo);
	}
	 
	/**
	* 코디에 사용된 옷 등록
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public void insertCodiUsedCloth(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디에 사용된 옷 등록");
		myDrsRmDao.insertCodiUsedCloth(myDrsRmVO);
	}
	 
	/**
	* 나의 코디에 사용된 옷 조회
	*
	* @param MyDressRoomVO myDrsRmVO
	* @returnList<myDressRoomValueObject>
	* @exceptionException
	*/
	public List<MyDressRoomVO> usedClothList(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("나의 코디에 사용된 옷 조회");
		
		List<MyDressRoomVO> usedClothList = myDrsRmDao.usedClothList(myDrsRmVO);
		
		return usedClothList;
	}
	 
	/**
	* 코디에 사용된 옷 삭제
	*
	* @param myDressRoomValueObject myDrsRmVO
	* @return
	* @exceptionException
	*/
	public void deleteUsedCloth(MyDressRoomVO myDrsRmVO) throws Exception{
		Logger.info("코디에 사용된 옷 삭제");
		myDrsRmDao.deleteUsedCloth(myDrsRmVO);
	}
	 
	/**
	* 수정한 코디 업데이트
	*
	* @param myDressRoomValueObject vo
	* @return
	* @exceptionException
	*/
	public void updateCodi(MyDressRoomVO vo) throws Exception{
	 	Logger.info("수정한 코디 업데이트");
	 	myDrsRmDao.updateCodi(vo);
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
		myDrsRmDao.insertReqst(reqstVO);
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
		myDrsRmDao.insertAnswr(reqstVO);
		myDrsRmDao.updateReqstState(reqstVO);
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
		
		reqstVO = myDrsRmDao.codiReqstReadInfo(myDrsRmVO);	//수정 코디요청 멘트 조회
		
		return reqstVO;
	}
	
	
//정우 추가
	//나의 옷장 조회
	public List<MyDressRoomVO> appMyDressRoomSelectList(MyDressRoomVO myDrsRmVO) throws Exception {
		Logger.info("나의 옷장 조회");
		
		return myDrsRmDao.appMyDressRoomSelectList(myDrsRmVO);
	}
}