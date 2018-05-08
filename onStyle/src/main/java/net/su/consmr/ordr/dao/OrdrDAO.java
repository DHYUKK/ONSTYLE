package net.su.consmr.ordr.dao;

import java.util.List;
import net.su.logger.Logger;

import org.springframework.stereotype.Repository;

import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.ordr.vo.EcashVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;
import net.su.consmr.ordr.vo.OrdrVO;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdrDAO extends SqlSessionDaoSupport{
//   마이페이지에서 주문조회(주문내역조회)로
   public List<OrderBreakdwnVO> allselect(OrderBreakdwnVO odBerkvo) throws Exception{
      Logger.info("마이페이지에서 주문조회(주문내역조회)");
      List<OrderBreakdwnVO> odBreakList = getSqlSession().selectList("consmrOrdrMapper.allselect", odBerkvo);
      Logger.info("!@#$!@#"+odBerkvo);
      return odBreakList;
   }
   
// 마이페이지에서 주문조회(취소/반품/교환조회)로
   public List<OrderBreakdwnVO> exchangelselect(OrderBreakdwnVO odBerkvo) throws Exception{
	   Logger.info("마이페이지에서 주문조회(취소/반품/교환조회)");
	   List<OrderBreakdwnVO> odexchangeList = getSqlSession().selectOne("consmrOrdrMapper.exchangelselect", odBerkvo);
	   return odexchangeList;
 }
   
//   주문조회에서 주문상세조회로
    public List<OrderBreakdwnVO> odbreakdetail(OrderBreakdwnVO odBerkvo) throws Exception{
       Logger.info("주문조회에서 주문상세조회로");
       System.out.println("@@@@@@@@@@@@@@@@@11  :  " + odBerkvo.getOneDatepicker());
       System.out.println("@@@@@@@@@@@@@@@@@22  :  " + odBerkvo.getTwoDatepicker());
       List<OrderBreakdwnVO> odbkList = getSqlSession().selectList("consmrOrdrMapper.odbreakdetail",odBerkvo);
      return odbkList;
    }
    
//	마이페이지에서 적립금 으로 
	public List<EcashVO> poinselect(EcashVO ecashvo) throws Exception{
	   Logger.info("마이페이지에서 적립금 으로 ");
	   List<EcashVO> pointList = getSqlSession().selectList("consmrOrdrMapper.poinselect", ecashvo);;
	   return pointList;
	}
	
// 주문자 조회
   public MemVO orderMemInfo(MemVO memVO) throws Exception{
	   Logger.info("주문자 조회");
	   MemVO orderMemInfo = getSqlSession().selectOne("consmrOrdrMapper.orderMemInfo", memVO);
	   return orderMemInfo;
   }
   
// 주문 성공 후 주문 정보를 주문테이블에 등록
   public void orderSuccess(OrdrVO ordrVo) throws Exception{
	   Logger.info("주문 성공 후 주문 정보를 주문테이블에 등록");
	   getSqlSession().insert("consmrOrdrMapper.orderSuccess",ordrVo);
   }

// 주문 정보 등록 후 주문 내역 테이블에 주문한 상품 정보 all 등록
   public void orderBreakdwnAllInsert(OrdrVO ordrVo) throws Exception{
	   Logger.info("주문 정보 등록 후 주문 내역 테이블에 주문한 상품 정보 all 등록");
	   getSqlSession().insert("consmrOrdrMapper.orderBreakdwnAllInsert",ordrVo);
   }
   
// 주문 정보 등록 후 주문 내역 테이블에 주문한 상품 정보 one 등록
   public void orderBreakdwnOneInsert(OrdrVO ordrVo) throws Exception{
	   Logger.info("주문 정보 등록 후 주문 내역 테이블에 주문한 상품 정보 all 등록");
	   getSqlSession().insert("consmrOrdrMapper.orderBreakdwnOneInsert",ordrVo);
	   getSqlSession().delete("consmrOrdrMapper.shpListDelete", ordrVo);
   }
}