package net.su.consmr.codi.service;

import java.util.List;

import net.su.consmr.codi.vo.CodiShrVO;

public interface CodiShrService {

   //코공게 전체 조회
   public List<CodiShrVO> selectCodiShrList(CodiShrVO codiShrVO) throws Exception;
   
   //코공게 베스트 조회
   public List<CodiShrVO> selectBestCodiShrList(CodiShrVO codiShrVO) throws Exception;

   //좋아요 버튼 색상
   public List<CodiShrVO> memLikeList(CodiShrVO codiShrVO) throws Exception;
   
   //좋아요 갯수
   public CodiShrVO countLike(CodiShrVO codiShrVO) throws Exception;

   //좋아요
   public CodiShrVO like(CodiShrVO codiShrVO) throws Exception;
   
   //스크랩
   public void scrap(CodiShrVO codiShrVO) throws Exception;
   
   //코디 상세보기
   public CodiShrVO codiView(CodiShrVO codiShrVO) throws Exception;
   
   //코디 공유 취소
   public void cancelShr(CodiShrVO codiShrVO) throws Exception;
   
   //회원 다른코디 조회
   public List<CodiShrVO> memCodiList(CodiShrVO codiShrVO) throws Exception;
   
   //코디 활용상품 조회
   public List<CodiShrVO> codiUseProdct(CodiShrVO codiShrVO) throws Exception;
   
   //댓글 등록
   public void insertReply(CodiShrVO codiShrVO) throws Exception;
   
   //댓글 조회
   public List<CodiShrVO> replyList(CodiShrVO codiShrVO) throws Exception;
   
   //댓글 삭제
   public void deleteReply(CodiShrVO codiShrVO) throws Exception;
}