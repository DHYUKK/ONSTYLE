package net.su.admin.codi.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.admin.codi.dao.AdminCodiShrDAO;
import net.su.admin.codi.vo.AdminCodiShrVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class AdminCodiShrServiceImpl implements AdminCodiShrService{

	@Resource
	private AdminCodiShrDAO adminCodiShrDao;
	
	/**
	* 코디공유  목록 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/	
	public List<AdminCodiShrVO> adminCodiShrList(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("코디공유  목록 조회");
		
		int codiShrListCount = adminCodiShrDao.codiShrListCount(shrVO);
		shrVO.setTotalRecordCount(codiShrListCount);
		
		List<AdminCodiShrVO> adminCodiShrList = adminCodiShrDao.adminCodiShrList(shrVO);

		return adminCodiShrList;
	}
	
	/**
	* 코디공유 게시글 삭제
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/	
	public void adminShrDelete(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("코디공유 게시글 삭제");

		adminCodiShrDao.adminShrDelete(shrVO);
	}
	
	/**
	* 코디공유 게시판 상세보기
	*
	* @param AdminCodiShrVO shrVO
	* @return  AdminCodiShrVO shrVO
	* @exception  Exception
	*/	
	public AdminCodiShrVO codiShrRead(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("코디공유 게시판 상세보기");

		shrVO = adminCodiShrDao.codiShrRead(shrVO);
		
		return shrVO;
	}

	/**
	* 회원 다른코디 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> memCodiList(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("회원 다른코디 조회");

		List<AdminCodiShrVO> memCodiList = adminCodiShrDao.memCodiList(shrVO);
		
		return memCodiList;
	}

	/**
	* 코디 활용상품 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> codiUseProdct(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("코디 활용상품 조회");

		List<AdminCodiShrVO> codiUseProdct = adminCodiShrDao.codiUseProdct(shrVO);
		
		return codiUseProdct;
	}
	
	/**
	* 댓글 조회
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> replyList(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("댓글 조회");
		
		int replyListCount = adminCodiShrDao.replyListCount(shrVO);
		shrVO.setTotalRecordCount(replyListCount);
		List<AdminCodiShrVO> replyList = adminCodiShrDao.replyList(shrVO);
		
		return replyList;
	}
	
	/**
	* 댓글 삭제
	*
	* @param AdminCodiShrVO shrVO
	* @return  
	* @exception  Exception
	*/	
	public void adminDeleteReply(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("댓글 삭제");

		adminCodiShrDao.adminDeleteReply(shrVO);
	}
	
	/**
	* 댓글 추가 조회
	*
	* @param	AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/
	public List<AdminCodiShrVO> moreReply(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("댓글 추가 조회");
		List<AdminCodiShrVO> replyList = adminCodiShrDao.moreReply(shrVO);
		
		return replyList;
	}
}
