//로그인 서비스
package net.su.consmr.login.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.consmr.mem.vo.MemVO;



public interface LoginService {

   public MemVO memLogin(MemVO memVO) throws Exception;
      
   public void memberInsert(MultipartHttpServletRequest request, MemVO memVO) throws Exception;
   
   public int idcheck(MemVO memVO) throws Exception;
   
   public int nicknmecheck(MemVO memVO)throws Exception;
   
}