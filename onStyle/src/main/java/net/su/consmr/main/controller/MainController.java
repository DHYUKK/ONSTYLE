package net.su.consmr.main.controller;

import java.util.List;

import net.su.logger.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.su.consmr.main.service.MainServiceImpl;
import net.su.consmr.mem.vo.MemVO;
import net.su.consmr.prodct.vo.ProdctVO;
/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	@Resource
	private MainServiceImpl mainServiceImpl;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String index(Model model, HttpSession session, MemVO memVO) throws Exception {		
		Logger.info("index");
		
		List<ProdctVO> mainProdctSelect = mainServiceImpl.mainProdctSelect();
		model.addAttribute("mainProdctSelect", mainProdctSelect);

		return "consmrView/main/consmrMain";			
	}
	
	@RequestMapping(value = "/menu.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String menu(Model model) {
		Logger.info("메뉴");
		
		return "consmrView/main/consmrMenu";
	}  
	
	//여기 보면서 따오기
	@RequestMapping(value = "/bootswatch.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Model model) {
	
		return "consmrView/main/bootswatch";
	}
	//메인에서 마이페이지메인화면 펼치기 
	@RequestMapping(value = "/mypageHome.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypagehome(Model model) {
		Logger.info("메인에서 마이페이지메인화면 펼치기");
		return "consmrView/mem/MypageHome";
	}
	
}