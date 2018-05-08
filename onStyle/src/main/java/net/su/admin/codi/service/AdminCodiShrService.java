package net.su.admin.codi.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.su.admin.codi.vo.AdminCodiShrVO;
import net.su.consmr.codi.vo.CodiShrVO;

public interface AdminCodiShrService {
	/**
	* 코디공유  목록 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/	
	public List<AdminCodiShrVO> adminCodiShrList(AdminCodiShrVO shrVO) throws Exception;
	
	/**
	* 코디공유 게시글 삭제
	*
	* @param AdminCodiShrVO shrVO
	* @return
	* @exception  Exception
	*/	
	public void adminShrDelete(AdminCodiShrVO shrVO) throws Exception;
	
	/**
	* 코디공유 게시판 상세보기
	*
	* @param AdminCodiShrVO shrVO
	* @return  AdminCodiShrVO shrVO
	* @exception  Exception
	*/	
	public AdminCodiShrVO codiShrRead(AdminCodiShrVO shrVO) throws Exception;

	/**
	* 회원 다른코디 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> memCodiList(AdminCodiShrVO shrVO) throws Exception;

	/**
	* 코디 활용상품 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> codiUseProdct(AdminCodiShrVO shrVO) throws Exception;
	
	/**
	* 댓글 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> replyList(AdminCodiShrVO shrVO) throws Exception;
	
	/**
	* 댓글 삭제
	*
	* @param AdminCodiShrVO shrVO
	* @return 
	* @exception  Exception
	*/	
	public void adminDeleteReply(AdminCodiShrVO shrVO) throws Exception;

	/**
	* 댓글 추가 조회
	*
	* @param	AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> moreReply(AdminCodiShrVO shrVO) throws Exception;
}
