package net.su.consmr.ordr.service;

import java.util.List;

import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.ordr.vo.EcashVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;
import net.su.consmr.ordr.vo.OrdrVO;

public interface OrdrService {

//   마이페이지에서 주문조회(주문내역조회)로
   public List<OrderBreakdwnVO> allselect(OrderBreakdwnVO odBerkvo) throws Exception;
   
// 마이페이지에서 주문조회(취소/반품/교환조회)로
   public List<OrderBreakdwnVO> exchangelselect(OrderBreakdwnVO odBerkvo) throws Exception;
//   주문조회에서 주문상세조회로
   public List<OrderBreakdwnVO> odbreakdetail(OrderBreakdwnVO odBerkvo) throws Exception;
   
// 마이페이지에서 적립금 으로 
   public List<EcashVO> poinselect(EcashVO ecashvo) throws Exception;
   
// 주문자 조회
   public MemVO orderMemInfo(MemVO memVO) throws Exception;
   
// 주문 성공 후 주문 정보를 주문테이블에 등록
   public void orderSuccess(OrdrVO ordrVo) throws Exception;
}