package net.su.app.appCodi.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.app.appCodi.service.AppMyDressRoomService;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AppMyDressRoomController {
	@Resource
	AppMyDressRoomService appMyDressRoomService;
	
	//옷 조회
	@RequestMapping(value = "/appClothSelectList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<MyDressRoomVO> clothSelect(Model model, MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("APP 옷 조회");
		myDrsRmVO.setMem_seq(5);
		Logger.info("APP 옷 조회11111111    "+myDrsRmVO.getBigGroup());
		Logger.info("APP 옷 조회22222222    "+myDrsRmVO.getCategory_seq());
		List<MyDressRoomVO> clothSelectList = appMyDressRoomService.clothSelectList(myDrsRmVO);
		Logger.info("켈룩켈룩켈룩켈룩");
		Logger.info("뭘까");
		return clothSelectList;
	}
	
	//선택한 옷 로컬경로에 저장
	@RequestMapping(value = "/copyClothes.do", method ={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void copyClothes(MyDressRoomVO myDrsRmVO, HttpSession session) throws Exception {
		Logger.info("나의 옷 등록");
		
		FileInputStream fis = null;
		FileOutputStream fos = null; 
		
		try {
			// 원본파일
			fis = new FileInputStream("C:\\Users\\SERVER-2\\Desktop\\existProject\\onstyle\\.metadata\\.plugins\\"
					+ "org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\onStyle\\"+myDrsRmVO.getSelected_clothes_src());	
			
			// 복사위치(platforms\android\assets\www\img\codi\clothes 경로로 나중에 고치기)
			fos = new FileOutputStream("C:\\Users\\SERVER-2\\Desktop\\test.png");								
			   
			byte[] buffer = new byte[1024];
			int readcount = 0;
			  
			while((readcount=fis.read(buffer)) != -1) {
				fos.write(buffer, 0, readcount);		// 파일 복사 

		}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			fis.close();
			fos.close();
		}
	}
}
