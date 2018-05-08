package net.su.consmr.codi.dao;

import java.util.List;

import net.su.consmr.codi.vo.CodiShrVO;
import net.su.logger.Logger;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CodiShrDAO extends SqlSessionDaoSupport{

   //전체 코디 조회
   public List<CodiShrVO> selectCodiShrList(CodiShrVO codiShrVO) throws Exception {
      Logger.info(null);      
      List<CodiShrVO> codiShrList = getSqlSession().selectList("codiShrMapper.selectCodiShrList", codiShrVO);   
      
      return codiShrList;
   }
   
   //베스트 코디 조회
   public List<CodiShrVO> selectBestCodiShrList(CodiShrVO codiShrVO) throws Exception {
      Logger.info(null);      
      List<CodiShrVO> bestCodiShrList = getSqlSession().selectList("codiShrMapper.selectBestCodiShrList", codiShrVO);   
      System.out.println("확인3 : "+codiShrVO.getToday());
      return bestCodiShrList;
   }
   
   //회원 좋아요 색상
   public List<CodiShrVO> memLikeList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> memLikeList = getSqlSession().selectList("codiShrMapper.memLike", codiShrVO);

      return memLikeList; 
   }
   
   //좋아요 갯수
   public CodiShrVO countLike(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);

      int codi_shr_seq = codiShrVO.getCodi_shr_seq();
      codiShrVO = getSqlSession().selectOne("codiShrMapper.countLike", codiShrVO);
      
      if(codiShrVO.getCodi_shr_seq()==0){
         codiShrVO.setCodi_shr_seq(codi_shr_seq);
      
         return codiShrVO;
      }
      else {
         return codiShrVO;
      }
   }
   
   //좋아요
   public CodiShrVO like(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      
      int chkCodi_shr_seq = codiShrVO.getCodi_shr_seq();
      int chkMem_seq = codiShrVO.getMem_seq();
      
      codiShrVO = getSqlSession().selectOne("codiShrMapper.checkLike" ,codiShrVO);
      
      codiShrVO.setCodi_shr_seq(chkCodi_shr_seq);
      codiShrVO.setMem_seq(chkMem_seq);
      
      if(codiShrVO.getLiked() == 0){
         getSqlSession().insert("codiShrMapper.insertLike", codiShrVO);
         codiShrVO = getSqlSession().selectOne("codiShrMapper.checkLike" ,codiShrVO);
         
         return codiShrVO;
      }
      else{
         getSqlSession().delete("codiShrMapper.deleteLike", codiShrVO);
         codiShrVO = getSqlSession().selectOne("codiShrMapper.checkLike" ,codiShrVO);
         
         return codiShrVO;
      }
   }

   //스크랩
   public void scrap(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      getSqlSession().insert("codiShrMapper.insertScrap", codiShrVO);
   }
   
   //코디 상세보기
   public CodiShrVO codiView(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      codiShrVO = getSqlSession().selectOne("codiShrMapper.selectCodi", codiShrVO);
      
      return codiShrVO;
   }
   
   //코디 공유 취소
   public void cancelShr(CodiShrVO codiShrVO) throws Exception{
	   Logger.info(null);
	   
	   getSqlSession().delete("codiShrMapper.cancelShr", codiShrVO);
   }
   
   //회원 다른 코디 보기
   public List<CodiShrVO> memCodiList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> memCodiList = getSqlSession().selectList("codiShrMapper.memCodiList", codiShrVO);
      
      return memCodiList;
   }
   
   //코디 활용 상품 조회
   public List<CodiShrVO> codiUseProdct(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> codiUseProdct = getSqlSession().selectList("codiShrMapper.codiUseProdct", codiShrVO);
      
      return codiUseProdct;
   } 
   
   //댓글 등록
   public void insertReply(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      getSqlSession().insert("codiShrMapper.insertReply", codiShrVO);
   }

   //댓글 조회
   public List<CodiShrVO> replyList(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      List<CodiShrVO> replyList = getSqlSession().selectList("codiShrMapper.selectReply", codiShrVO);
      
      return replyList;
   }
   //댓글 삭제
   public void deleteReply(CodiShrVO codiShrVO) throws Exception{
      Logger.info(null);
      getSqlSession().delete("codiShrMapper.deleteReply", codiShrVO);
   }

}