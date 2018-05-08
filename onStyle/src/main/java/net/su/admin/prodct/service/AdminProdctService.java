package net.su.admin.prodct.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.consmr.prodct.vo.ProdctVO;

public interface AdminProdctService {
	//상품코드조회
	public ProdctVO selectProdctCode() throws Exception;
	//상품등록
	public void adminProdctInsert(ProdctVO prodctVO, HttpSession session) throws Exception;
	//이미지 등록
	public void adminProdctImgCreate(MultipartHttpServletRequest request, ProdctVO prodctVO, HttpSession session) throws Exception;
	//사이즈 등록 및 조회
	public List<ProdctVO> selectTempSizetList(ProdctVO prodctVO) throws Exception;
	//사이즈 임시테이블 삭제
	public void deleteTempSize(ProdctVO prodctVO) throws Exception;
	//거래처 리스트 조회
	public List<ProdctVO> selectClientList() throws Exception;
	//색상 등록
	public void adminProdctColorInsert(ProdctVO prodctVO) throws Exception;
	//상품 수정
	public void prodctUpdate(ProdctVO prodctVO, HttpSession session) throws Exception;
	//상품 색상 삭제
	public void prodctColorDelete(ProdctVO prodctVO) throws Exception;
//svntest
}