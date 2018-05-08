package net.su.admin.prodct.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.su.admin.prodct.service.AdminProdctDisplyService;
import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 진열관리 컨트롤러입니다.
 * 
 * @see   net.su.admin.prodct.controller.AdminProdctDisplyController
 * @version  1.0 
 * @ author 정민기
 */

@Controller
public class AdminProdctDisplyController {
   @Resource
   private AdminProdctDisplyService adminProdctDisplyService;
   
   //진열관리 화면 이동
   @RequestMapping(value = "/adminProdctDisply.do", method = {RequestMethod.POST, RequestMethod.GET})
   public String ProdctDisply(AdminProdctVO adminProdctVO, Model model) throws Exception{
      Logger.info("진열관리 화면 이동");

      return "adminView/prodct/prodctDisply";
   }
   
   //카테고리 조회
   @ResponseBody
   @RequestMapping(value = "/selectCategoryList.do", method = {RequestMethod.POST, RequestMethod.GET})
   public List<AdminProdctVO> selectCategoryList(Model model) throws Exception{
      Logger.info("카테고리 조회");
      
      List<AdminProdctVO> categoryList = adminProdctDisplyService.selectCategoryList();
       model.addAttribute("categoryList", categoryList);
      
      return categoryList;
   }
   
   //메인 진열 상품 조회
   @RequestMapping(value = "/mainDisply.do", method = {RequestMethod.POST, RequestMethod.GET})
   public String mainDisplyProdctList(AdminProdctVO adminProdctVO, Model model) throws Exception{
      Logger.info("메인 진열 상품조회");
      
      List<AdminProdctVO> mainDisplyProdctList = adminProdctDisplyService.categoryProdctList(adminProdctVO);
       model.addAttribute("mainDisplyProdctList", mainDisplyProdctList);
      
      return "adminView/prodct/prodctCategoryDisply";
   }
   
   //jsTree 상품 조회
   @ResponseBody
   @RequestMapping(value = "/categoryDisply.do", method = {RequestMethod.POST, RequestMethod.GET})
   public List<AdminProdctVO> categoryDisply(AdminProdctVO adminProdctVO, Model model) throws Exception{
      Logger.info("카테고리 상품조회"+adminProdctVO.getDisplyArray());
      
      List<AdminProdctVO> mainDisplyProdctList = adminProdctDisplyService.categoryProdctList(adminProdctVO);
       model.addAttribute("mainDisplyProdctList", mainDisplyProdctList);
      
      return mainDisplyProdctList;
   }
   
   //진열 상품 검색
   @ResponseBody
   @RequestMapping(value = "/searchMainDisply.do", method = {RequestMethod.POST, RequestMethod.GET})
   public List<AdminProdctVO> searchMainDisplyProdctList(AdminProdctVO adminProdctVO, Model model) throws Exception{
      Logger.info("진열 상품 검색");
      
      List<AdminProdctVO> mainDisplyProdctList = adminProdctDisplyService.searchProdctList(adminProdctVO);
       model.addAttribute("mainDisplyProdctList", mainDisplyProdctList);
      
      return mainDisplyProdctList;
   }
   
   //상품 삭제
   @ResponseBody
   @RequestMapping(value = "/deleteDisplyProdct.do", method = {RequestMethod.POST, RequestMethod.GET})
   public void deleteDisplyProdct(AdminProdctVO adminProdctVO) throws Exception {
      Logger.info("상품 삭제");
      adminProdctDisplyService.deleteDisplyProdct(adminProdctVO);
   }
   
   //상품 상태 변경
   @ResponseBody
   @RequestMapping(value = "/updateProdctState.do", method = {RequestMethod.POST, RequestMethod.GET})
   public void updateProdctState(AdminProdctVO adminProdctVO) throws Exception {
      Logger.info(null);
      System.out.println("state = "+adminProdctVO.getState());
      adminProdctDisplyService.updateProdctState(adminProdctVO);
   }
   
   //분류 조회
   @ResponseBody
   @RequestMapping(value = "/selectCategory.do", method = {RequestMethod.POST, RequestMethod.GET})
   public List<AdminProdctVO> selectCategory(AdminProdctVO adminProdctVO, Model model) throws Exception{
      Logger.info("카테고리 조회");
      Logger.info("확인 : "+adminProdctVO.getCategory_nme());
      
      List<AdminProdctVO> categoryList = adminProdctDisplyService.selectCategory(adminProdctVO);
       model.addAttribute("categoryList", categoryList);
      
      return categoryList;
   }
   
   //메인 진열 순서 변경
   @RequestMapping(value = "/updateMainDisplyOrdr.do", method = {RequestMethod.POST, RequestMethod.GET})
   @ResponseBody
   public void updateMainDisplayOrder(@RequestBody Map<String, Object> map, AdminProdctVO adminProdctVO) throws Exception {
      Logger.info("메인진열 순서 변경, displyArray = "+adminProdctVO.getDisplyArray());
      
      System.out.println(map.get("disply")+"@@@@@@@");
      String[] data = map.get("disply").toString().split(",");
      for(int i=0; i<data.length; i++){
         System.out.println(data[i]);
         
         data[i] = data[i].replace(" ", "");
         if(data[i].contains("[")){
            data[i] = data[i].replace("[", "");
         }
         else if(data[i].contains("]")){
            data[i] = data[i].replace("]", "");
         }
         
         System.out.println("변경 값 : "+data[i]);
      }
      
      adminProdctDisplyService.updateMainDisplyOrdr(data, adminProdctVO);
   }
   
   //분류 수정 팝업
   @RequestMapping(value = "/categoryUpdatePopUp.do", method = {RequestMethod.POST, RequestMethod.GET})
   public String categoryUpdatePopUp(AdminProdctVO adminProdctVO, Model model) throws Exception{
      Logger.info("분류 수정 팝업");
      //상품 조회
      List<AdminProdctVO> popUpProdctList = adminProdctDisplyService.selectPopUpProdct(adminProdctVO);
       model.addAttribute("popUpProdctList", popUpProdctList);
      
      return "adminView/prodct/categoryUpdatePopUp";
   }
   
   //팝업 상품 카테고리 변경
   @ResponseBody
   @RequestMapping(value = "/updatePopUpProdct.do", method = {RequestMethod.POST, RequestMethod.GET})
   public void updatePopUpProdct(AdminProdctVO adminProdctVO, Model model) throws Exception{
      Logger.info("팝업 카테고리 변경"+adminProdctVO.getGroup());
      
      adminProdctDisplyService.updatePopUpProdct(adminProdctVO);
   }
   
}