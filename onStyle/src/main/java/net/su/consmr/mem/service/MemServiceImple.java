package net.su.consmr.mem.service;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import net.su.common.security.Base64Utils;
import net.su.consmr.login.service.LoginServiceImpl;
import net.su.consmr.mem.dao.MemDAO;
import net.su.consmr.mem.vo.MemVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class MemServiceImple implements MemService {

   @Resource
   MemDAO memDao;
   
   Base64Utils base64 = new Base64Utils();
   String encryptKey = "temp11111111111111111111";
   
   //패스워드 확인   
   public MemVO passCheck(MemVO memVO) throws Exception{
		//기본 pw
		String W_ORG_FG = memVO.getMem_pw();
		//암호화 pw
		String EN_ORG_FG = base64.encrypt(W_ORG_FG,encryptKey);
		memVO.setMem_pw(EN_ORG_FG);
		memVO = memDao.passCheck(memVO);
		return memVO;
   }
   //join정보 불러오기
	public MemVO joinDetail(MemVO memVO) throws Exception{
		memVO = memDao.joinDetail(memVO);
		return memVO;
	}
   
   //join화면정보 수정하기!
	public void upFinish(MemVO memVO, MultipartHttpServletRequest request) throws Exception{
		memVO.setMem_pw(base64.encrypt(memVO.getMem_pw(), encryptKey));
		
		MemServiceImple memServiceImple = new MemServiceImple();
        Map<String, MultipartFile> files = request.getFileMap();
        CommonsMultipartFile getEvntImgCmf = (CommonsMultipartFile) files.get("memimg_src");
        
        if(getEvntImgCmf.getSize() !=0) {
           ServletContext context = request.getSession().getServletContext();
           if (getEvntImgCmf != null) {
              String filePath = "/resources/consmr/login/img/profile" + memVO.getMem_seq() + ".png";
              String dirPath = "/resources/consmr/login/img";
              memVO.setMem_img_route(filePath);
              memServiceImple.memimgsave(context.getRealPath(filePath), context.getRealPath(dirPath), getEvntImgCmf);
           }
        }
		memDao.upFinish(memVO);
		memDao.upFinish2(memVO);
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
}