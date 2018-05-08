package net.su.admin.codi.dao;

import java.util.List;

import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.admin.codi.vo.AdminCodiShrVO;

@Repository
public class AdminCodiShrDAO extends SqlSessionDaoSupport{
	/**
	* 코디공유 목록 조회
	*
	* @param AdminCodishrVO shrVO
	* @return  List<AdminCodishrVO>
	* @exception  Exception
	*/	
	public List<AdminCodiShrVO> adminCodiShrList(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("코디공유  목록 조회");
		List<AdminCodiShrVO> adminCodiShrList = getSqlSession().selectList("adminCodiShrMapper.adminCodiShrList", shrVO);

		return adminCodiShrList;
	}
	
	/**
	* 코디공유 목록 개수 조회
	*
	* @param AdminCodishrVO shrVO
	* @return  int
	* @exception  Exception
	*/	
	public int codiShrListCount(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("코디공유  목록  개수 조회");
		int codiShrListCount = getSqlSession().selectOne("adminCodiShrMapper.codiShrListCount", shrVO);
		
		return codiShrListCount;
	}
	
	/**
	* 코디공유 게시글 삭제
	*
	* @param AdminCodiShrVO shrVO
	* @return  List<AdminCodiShrVO>
	* @exception  Exception
	*/	
	public void adminShrDelete(AdminCodiShrVO shrVO) throws Exception{
		getSqlSession().delete("adminCodiShrMapper.adminShrDelete", shrVO);
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
		shrVO = getSqlSession().selectOne("adminCodiShrMapper.codiShrRead", shrVO);
		
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
		
		List<AdminCodiShrVO> memCodiList = getSqlSession().selectList("adminCodiShrMapper.memCodiList", shrVO);
		
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
		
		List<AdminCodiShrVO> codiUseProdct = getSqlSession().selectList("adminCodiShrMapper.codiUseProdct", shrVO);
		
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
		
		List<AdminCodiShrVO> replyList = getSqlSession().selectList("adminCodiShrMapper.replyList", shrVO);
		
		return replyList;
	}
	
	/**
	* 댓글 개수 조회
	*
	* @param AdminCodishrVO shrVO
	* @return  int
	* @exception  Exception
	*/	
	public int replyListCount(AdminCodiShrVO shrVO) throws Exception{
		Logger.info("댓글 개수 조회");
		int replyListCount = getSqlSession().selectOne("adminCodiShrMapper.replyListCount", shrVO);
		
		return replyListCount;
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
		
		getSqlSession().delete("adminCodiShrMapper.adminDeleteReply", shrVO);
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

		List<AdminCodiShrVO> replyList = getSqlSession().selectList("adminCodiShrMapper.replyList", shrVO);
		
		return replyList;
	}
}
