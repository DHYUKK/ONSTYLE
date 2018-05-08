//로그인 컨트롤러
package net.su.consmr.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.consmr.login.service.LoginService;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class LoginController {
   
   @Resource
   private LoginService LoginService;
   
      //로그인 화면이동
      @RequestMapping(value = "/login.do", method =  RequestMethod.GET)
      public String loginView(HttpSession session) 
      {
         Logger.info("로그인화면인동");
         return "/consmrView/login/loginForm";
         
      }
      //회원가입 화면이동
      @RequestMapping(value = "/insertView.do", method =  {RequestMethod.GET, RequestMethod.POST})
      public String insertView() 
      {
         Logger.info("회원가입화면인동");
         return "/consmrView/login/memInsert";
         
      }
      
      // 회원 로그인 체크 
      @RequestMapping(value = "/memLoginCheck.do")
      @ResponseBody
      public MemVO memLogin(MemVO memVO, HttpSession session) throws Exception
      {
         Logger.info("회원로그인 체크");
         
           memVO = LoginService.memLogin(memVO);
           session.setAttribute("userInfo", memVO);  
         return memVO;
      } 
      
      // 로그아웃
      @RequestMapping(value = "/logout.do")
      public String logout(HttpSession session) throws Exception
      {
         Logger.info("로그아웃");
         session.invalidate();
         return "redirect:/login.do";
      }
      
      // 회원가입
      @ResponseBody
      @RequestMapping(value ="/memInsert.do",method={RequestMethod.GET,RequestMethod.POST})
      public String memInsert(MultipartHttpServletRequest request, MemVO memVO) throws Exception{
          Logger.info("회원가입");
          LoginService.memberInsert(request, memVO);
          return "redirect:/login.do"; 
      }
      //아이디 중복체크
      @ResponseBody
      @RequestMapping(value="/idcheck.do", method={RequestMethod.GET,RequestMethod.POST})
      public int idcheck(MemVO memVO) throws Exception{
         Logger.info("아이디중복체크");
         System.out.println("아이디 값 : " + memVO.getMem_id());
        int idcheck= LoginService.idcheck(memVO);
        return idcheck;
      }
      //닉네임 중복체크
      @ResponseBody
      @RequestMapping(value="/nicknmecheck.do", method={RequestMethod.GET,RequestMethod.POST})
      public int nicknmecheck(MemVO memVO) throws Exception{
         Logger.info("닉네임중복체크");
         System.out.println("닉 값 : " + memVO.getMem_nicknme());
        int nicknmecheck= LoginService.nicknmecheck(memVO);
        return nicknmecheck;
      }
}