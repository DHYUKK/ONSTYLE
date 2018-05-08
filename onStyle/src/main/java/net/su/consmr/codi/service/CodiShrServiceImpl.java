package net.su.consmr.codi.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.consmr.codi.dao.CodiShrDAO;
import net.su.consmr.codi.vo.CodiShrVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class CodiShrServiceImpl implements CodiShrService{
   
   @Resource
   CodiShrDAO codiShrDao;
   
   //전체 코디 조회
   public List<CodiShrVO> selectCodiShrList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> codiShrList = codiShrDao.selectCodiShrList(codiShrVO);
      
      return codiShrList;
   }
   
   //베스트 코디 조회
   public List<CodiShrVO> selectBestCodiShrList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> bestCodiShrList = codiShrDao.selectBestCodiShrList(codiShrVO);
      System.out.println("확인2 : "+codiShrVO.getToday());
      return bestCodiShrList;
   }
   
   //회원 좋아요 색상
   public List<CodiShrVO> memLikeList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> memLikeList = codiShrDao.memLikeList(codiShrVO);
      
      return memLikeList;
   }

   //좋아요 갯수
   public CodiShrVO countLike(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      codiShrVO = codiShrDao.countLike(codiShrVO);
      
      return codiShrVO;
   }
   
   //좋아요
   public CodiShrVO like(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      codiShrVO = codiShrDao.like(codiShrVO);
      
      return codiShrVO;
   }
   
   //스크랩
   public void scrap(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      codiShrDao.scrap(codiShrVO);
   }
   
   //코디 상세보기
   public CodiShrVO codiView(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      codiShrVO = codiShrDao.codiView(codiShrVO);
      
      return codiShrVO;
   }
   
   //코디 공유 취소
   public void cancelShr(CodiShrVO codiShrVO) throws Exception{
	   Logger.info(null);
	   codiShrDao.cancelShr(codiShrVO);
   }
   
   //회원 다른 코디 조회
   public List<CodiShrVO> memCodiList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> memCodiList = codiShrDao.memCodiList(codiShrVO);
      
      return memCodiList;
   }
   
   //코디 활용 상품 조회
   public List<CodiShrVO> codiUseProdct(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> codiUseProdct = codiShrDao.codiUseProdct(codiShrVO);
      
      return codiUseProdct;
   } 
   
   //댓글 등록
   public void insertReply(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      codiShrDao.insertReply(codiShrVO);
   }
   
   //댓글 조회
   public List<CodiShrVO> replyList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> replyList = codiShrDao.replyList(codiShrVO);
      
      return replyList;
   }
   
   //댓글 삭제
   public void deleteReply(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      codiShrDao.deleteReply(codiShrVO);
   }

}