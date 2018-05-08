package net.su.consmr.ordr.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.ordr.dao.OrdrDAO;
import net.su.consmr.ordr.vo.EcashVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;
import net.su.consmr.ordr.vo.OrdrVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;

@Service
public class OrdrServiceImple implements OrdrService{
   @Resource
   OrdrDAO ordrDao;
   
//   마이페이지에서 주문조회(주문내역조회)로
   public List<OrderBreakdwnVO> allselect(OrderBreakdwnVO odBerkvo) throws Exception{
      Logger.info("마이페이지에서 주문조회(주문내역조회)");
      List<OrderBreakdwnVO> odBreakList = ordrDao.allselect(odBerkvo);
      return odBreakList;
   }
   
// 마이페이지에서 주문조회(취소/반품/교환조회)로
   public List<OrderBreakdwnVO> exchangelselect(OrderBreakdwnVO odBerkvo) throws Exception{
	   Logger.info("마이페이지에서 주문조회(취소/반품/교환조회)");
	   List<OrderBreakdwnVO> odexchangeList = ordrDao.exchangelselect(odBerkvo);
	   return odexchangeList;
 }
   
//   주문조회에서 주문상세조회로
   public List<OrderBreakdwnVO> odbreakdetail(OrderBreakdwnVO odBerkvo) throws Exception{
      Logger.info("주문조회에서 주문상세조회로");
      List<OrderBreakdwnVO> odbkList = ordrDao.odbreakdetail(odBerkvo);
      return odbkList;
   }
// 마이페이지에서 적립금 으로 
   public List<EcashVO> poinselect(EcashVO ecashvo) throws Exception{
	   Logger.info("마이페이지에서 적립금 으로 ");
	   List<EcashVO> pointList = ordrDao.poinselect(ecashvo);
	   return pointList;
   }
// 주문자 조회
   public MemVO orderMemInfo(MemVO memVO) throws Exception{
	   Logger.info("주문자 조회");
	   MemVO orderMemInfo = ordrDao.orderMemInfo(memVO);
	   return orderMemInfo;
   }

// 주문 성공 후 주문 정보를 주문테이블에 등록
   public void orderSuccess(OrdrVO ordrVo) throws Exception{
	   Logger.info("주문 성공 후 주문 정보를 주문테이블에 등록");
	   ordrDao.orderSuccess(ordrVo);
	   System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 주문 등록된 주문seq는? : "+ ordrVo.getOrder_seq());
	   
	   if(ordrVo.getOrder_flag().equals("all")) {
		   Logger.info("주문 정보 등록 후 주문 내역 테이블에 주문한 상품 정보 all 등록");
		   ordrDao.orderBreakdwnAllInsert(ordrVo);
	   }else if(ordrVo.getOrder_flag().equals("one")) {
		   Logger.info("주문 정보 등록 후 주문 내역 테이블에 주문한 상품 정보 one 등록");
		   ordrDao.orderBreakdwnOneInsert(ordrVo);
	   }
	   
   }
}