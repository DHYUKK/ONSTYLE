package net.su.app.appLogin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.consmr.login.service.LoginService;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AppLoginController {

	 @Resource
	 private LoginService LoginService;
	 
	//회원 로그인 
	@ResponseBody
	@RequestMapping(value = "/appLoginCheck.do")
	public MemVO appLogin(MemVO memVO, HttpSession session) throws Exception{
		Logger.info("app 로그인");
	
		memVO = LoginService.memLogin(memVO);
		session.setAttribute("userInfo", memVO);  
		
		return memVO;
	} 
	 
}
