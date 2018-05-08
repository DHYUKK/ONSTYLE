package net.su.consmr.mem.dao;

import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
   public class MemDAO extends SqlSessionDaoSupport{
   //패스워드 확인
   public MemVO passCheck(MemVO memVO) throws Exception{
      Logger.info("DAO : 패스워드 확인");
      memVO = getSqlSession().selectOne("consmrMemMapper.passCheck",memVO);
      return memVO;
   }
//join 정보 조회
   public MemVO joinDetail(MemVO memVO)throws Exception{
      Logger.info("DAO : join 정보조회");
      memVO = getSqlSession().selectOne("consmrMemMapper.joinDetail",memVO);
      return memVO;
   }
//join 정보 수정!
   public void upFinish(MemVO memVO)throws Exception{
      Logger.info("DAO : join 정보수정  :  "+memVO.getMem_adrs());
      getSqlSession().update("consmrMemMapper.upFinish",memVO);
   }
   public void upFinish2(MemVO memVO)throws Exception{
	   getSqlSession().update("consmrMemMapper.upFinish2",memVO);
   }
}