package net.su.consmr.mem.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.consmr.mem.vo.MemVO;

public interface MemService {
   //패스워드확인하는곳
   public MemVO passCheck(MemVO memVO) throws Exception;
   
   //join화면 정보 불러오기
   public MemVO joinDetail(MemVO memVO) throws Exception;
   
   //join화면정보 수정하기!
   public void upFinish(MemVO memVO, MultipartHttpServletRequest request) throws Exception;
   
}