//로그인 dao
package net.su.consmr.login.dao;



import net.su.logger.Logger;
import net.su.consmr.mem.vo.MemVO;

import org.springframework.stereotype.Repository;
import org.mybatis.spring.support.SqlSessionDaoSupport;

//import net.su.logger.Logger;

@Repository
public class LoginDAO extends SqlSessionDaoSupport{
   
   public MemVO memLogin(MemVO memVO) throws Exception
   {
      Logger.info(null);
      return getSqlSession().selectOne("consmrLoginMapper.memLogin", memVO);
   }

   public MemVO memIdCheck(MemVO memVO) throws Exception{
      Logger.info(null);
      return getSqlSession().selectOne("consmrLoginMapper.memIdCheck", memVO);
      
   }
   public void memberInsert(MemVO memVO) throws Exception{
      Logger.info("회원가입");
     
      getSqlSession().insert("consmrLoginMapper.memberInsert", memVO);
     
   }
   
   public int idcheck(MemVO memVO)throws Exception{
      int idcheck = getSqlSession().selectOne("consmrLoginMapper.idcheck", memVO);
      return idcheck;
   }
   
   public int nicknmecheck(MemVO memVO)throws Exception{
      int nicknmecheck = getSqlSession().selectOne("consmrLoginMapper.nicknmecheck",memVO);
      return nicknmecheck;
   }
   
   public int selectSeq() throws Exception{
      Logger.info("seq뚝딱!");
      int mem_seq = getSqlSession().selectOne("consmrLoginMapper.selectseq");
      return mem_seq;
   }
   
   public void memSizeInsert(MemVO memVO) throws Exception{
      Logger.info("회원사이즈 입력");
      getSqlSession().insert("consmrLoginMapper.memSizeInsert", memVO);
   }
}