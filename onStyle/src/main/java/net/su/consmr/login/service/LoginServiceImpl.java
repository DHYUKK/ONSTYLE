//로그인 서비스 임플
package net.su.consmr.login.service;

import java.io.File;
import java.nio.file.Files;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import net.su.common.security.Base64Utils;
import net.su.consmr.codi.service.MyDressRoomServiceImpl;
import net.su.consmr.login.dao.LoginDAO;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class LoginServiceImpl implements LoginService {

   @Resource
   private LoginDAO loginDAO;

   Base64Utils base64 = new Base64Utils();
   String encryptKey = "temp11111111111111111111";

   public MemVO memLogin(MemVO memVO) throws Exception {
      // 기본 pw
      String W_ORG_FG = memVO.getMem_pw();

      // 암호화 pw
      String EN_ORG_FG = base64.encrypt(W_ORG_FG, encryptKey);
      Logger.info("!@%!@$!@#%!@#$" + EN_ORG_FG);
      memVO.setMem_pw(EN_ORG_FG);
      System.out.println("@@@@@@@@로그인 서비스임플@@@@@@@@" + memVO.getMem_id());
      System.out.println("@@@@@@@@로그인 서비스임플@@@@@@@@" + memVO.getMem_pw());

      return loginDAO.memLogin(memVO);
   }

   public void memberInsert(MultipartHttpServletRequest request, MemVO memVO) throws Exception {
      Logger.info("회원가입");
      memVO.setMem_pw(base64.encrypt(memVO.getMem_pw(), encryptKey));
      int mem_seq = loginDAO.selectSeq();
      memVO.setMem_seq(mem_seq);
      // 이미지 관련
         LoginServiceImpl loginServiceImpl = new LoginServiceImpl();
         Map<String, MultipartFile> files = request.getFileMap();
         CommonsMultipartFile getEvntImgCmf = (CommonsMultipartFile) files.get("memimg_src");
         
         if(getEvntImgCmf.getSize() !=0) {
            ServletContext context = request.getSession().getServletContext();
            if (getEvntImgCmf != null) {
               String filePath = "/resources/consmr/login/img/profile" + memVO.getMem_seq() + ".png";
               String dirPath = "/resources/consmr/login/img";
               memVO.setMem_img_route(filePath);
               loginServiceImpl.memimgsave(context.getRealPath(filePath), context.getRealPath(dirPath), getEvntImgCmf);
            }
         }
      loginDAO.memberInsert(memVO); // 회원가입
      loginDAO.memSizeInsert(memVO); //회원 옷치수
   }

   public void memimgsave(String filePath, String dirPath, CommonsMultipartFile cmf) throws Exception {
      Logger.info("회원 이미지 저장");
      File fileSaver = new File(filePath);
      File dirSaver = new File(dirPath);
      // 파일 업로드 처리 완료.
      try {
         if (!fileSaver.exists()) {
            dirSaver.mkdir();
         }
         cmf.transferTo(fileSaver);
         System.out.println("성공");
      } catch (Exception e) {
         System.out.println("실패: " + e);
      }
   }

   //아이디중복
   public int idcheck(MemVO memVO) throws Exception {
      int idcheck = loginDAO.idcheck(memVO);
      return idcheck;
   }
   //닉네임 중복
   public int nicknmecheck(MemVO memVO) throws Exception {
      int nicknmecheck = loginDAO.nicknmecheck(memVO);
      return nicknmecheck;
   }
}