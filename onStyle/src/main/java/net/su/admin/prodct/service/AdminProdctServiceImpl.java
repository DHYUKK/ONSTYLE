package net.su.admin.prodct.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import net.su.admin.prodct.dao.AdminProdctDAO;
import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.consmr.codi.service.MyDressRoomServiceImpl;
import net.su.consmr.codi.vo.MyDressRoomVO;
import net.su.consmr.prodct.vo.ProdctVO;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class AdminProdctServiceImpl implements AdminProdctService{

	@Resource
	private AdminProdctDAO adminProdctDao;
	
	public ProdctVO selectProdctCode() throws Exception{
	      Logger.info("상품코드 조회");
	      ProdctVO prodctVO = new ProdctVO();
	      //등록할 상품 코드 조회
	      prodctVO = adminProdctDao.selectProdctCode();
	      
	      return prodctVO;
   }
	
	public void adminProdctInsert(ProdctVO prodctVO, HttpSession session) throws Exception{
		Logger.info("상품등록");
		prodctVO.setProdct_img_route1((String) session.getAttribute("prodct_img1"));
		prodctVO.setProdct_img_route2((String) session.getAttribute("prodct_img2"));
		prodctVO.setProdct_img_route3((String) session.getAttribute("prodct_img3"));
		prodctVO.setProdct_img_route4((String) session.getAttribute("prodct_img4"));
		if(prodctVO.getBigCategory() == 1 || prodctVO.getBigCategory() == 2){
			prodctVO.setCategory_seq(prodctVO.getMidCategory());
		}
		else{
			prodctVO.setCategory_seq(prodctVO.getBigCategory());
		}
		adminProdctDao.adminProdctInsert(prodctVO);
	
	}
	public void adminProdctColorInsert(ProdctVO prodctVO) throws Exception{
		adminProdctDao.adminProdctColorInsert(prodctVO);
	}
	public List<ProdctVO> selectTempSizetList(ProdctVO prodctVO) throws Exception{
		List<ProdctVO> TempSizeList = adminProdctDao.selectTempSizetList(prodctVO);
		return TempSizeList;
	}
	public List<ProdctVO> selectClientList() throws Exception{
		List<ProdctVO> clientList = adminProdctDao.selectClientList();
		return clientList;
	}
	
	public void adminProdctImgCreate(MultipartHttpServletRequest request, ProdctVO prodctVO, HttpSession session) throws Exception
	{
		Logger.info(null);
		AdminProdctServiceImpl adminProdctServiceImpl = new AdminProdctServiceImpl();

		Map<String, MultipartFile> files = request.getFileMap();
		
		CommonsMultipartFile getMainCmf = (CommonsMultipartFile) files.get("prodct_img1");
		CommonsMultipartFile getDetlCmfOne = (CommonsMultipartFile) files.get("prodct_img2");
		CommonsMultipartFile getDetlCmfTwo = (CommonsMultipartFile) files.get("prodct_img3");
		CommonsMultipartFile getDetlCmfThree = (CommonsMultipartFile) files.get("prodct_img4");
		ServletContext context = request.getSession().getServletContext();
		if(getMainCmf.getSize()!=0)
		{
			String filePath ="/resources/image/prodct/"+prodctVO.getProdct_seq()+"/main.jpg";
			String dirPath ="/resources/image/prodct/"+prodctVO.getProdct_seq();
			System.out.println("###"+context.getRealPath(filePath));
			session.setAttribute("prodct_img1", filePath);
			adminProdctServiceImpl.selProdctImgSave(context.getRealPath(filePath), context.getRealPath(dirPath), getMainCmf);
		}
		else
		{
			session.setAttribute("mainImg", "/resources/admin/prodct/img/noimage1.png");
		}
		
		if(getDetlCmfOne.getSize()!=0)
		{
			String filePath ="/resources/image/prodct/"+prodctVO.getProdct_seq()+"/detlOne.jpg";
			String dirPath ="/resources/image/prodct/"+prodctVO.getProdct_seq();
			System.out.println("###"+context.getRealPath(filePath));
			session.setAttribute("prodct_img2", filePath);
			adminProdctServiceImpl.selProdctImgSave(context.getRealPath(filePath), context.getRealPath(dirPath), getDetlCmfOne);
		}
		else
		{
			session.setAttribute("detlImg1", "/resources/admin/prodct/img/noimage1.png");
		}
		
		if(getDetlCmfTwo.getSize()!=0)
		{
			String filePath ="/resources/image/prodct/"+prodctVO.getProdct_seq()+"/detlTwo.jpg";
			String dirPath ="/resources/image/prodct/"+prodctVO.getProdct_seq();
			System.out.println("###"+context.getRealPath(filePath));
			session.setAttribute("prodct_img3", filePath);
			adminProdctServiceImpl.selProdctImgSave(context.getRealPath(filePath), context.getRealPath(dirPath), getDetlCmfTwo);
		}
		else
		{
			session.setAttribute("detlImg2", "/resources/admin/prodct/img/noimage1.png");
		}
		
		if(getDetlCmfThree.getSize()!=0)
		{
			String filePath ="/resources/image/prodct/"+prodctVO.getProdct_seq()+"/detlThree.jpg";
			String dirPath ="/resources/image/prodct/"+prodctVO.getProdct_seq();
			System.out.println("###"+context.getRealPath(filePath));
			session.setAttribute("prodct_img4", filePath);
			adminProdctServiceImpl.selProdctImgSave(context.getRealPath(filePath), context.getRealPath(dirPath), getDetlCmfThree);
		}
		else
		{
			session.setAttribute("detlImg3", "/resources/admin/prodct/img/noimage1.png");
		}
	}	
	public void selProdctImgSave(String filePath, String dirPath, CommonsMultipartFile cmf) throws Exception
	{
		Logger.info(null);
		File fileSaver = new File(filePath);
		File dirSaver = new File(dirPath);
		// 파일 업로드 처리 완료.
		try {
			if(!dirSaver.exists())
			{
				dirSaver.mkdir();// 지정된 폴더 절대경로에 폴더 생성
			}
			cmf.transferTo(fileSaver); // 파일생성
			// insert method
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패: "+ e);
		}
	}
	public void deleteTempSize(ProdctVO prodctVO) throws Exception{
		//임시 사이즈 삭제
		adminProdctDao.deleteTempSize(prodctVO);
	}
	public void prodctUpdate(ProdctVO prodctVO, HttpSession session) throws Exception
	{
		prodctVO.setProdct_img_route1((String) session.getAttribute("prodct_img1"));
		prodctVO.setProdct_img_route2((String) session.getAttribute("prodct_img2"));
		prodctVO.setProdct_img_route3((String) session.getAttribute("prodct_img3"));
		prodctVO.setProdct_img_route4((String) session.getAttribute("prodct_img4"));
		if(prodctVO.getBigCategory() == 1 || prodctVO.getBigCategory() == 2){
			prodctVO.setCategory_seq(prodctVO.getMidCategory());
		}
		else{
			prodctVO.setCategory_seq(prodctVO.getBigCategory());
		}
		adminProdctDao.prodctUpdate(prodctVO);
	}
	public void prodctColorDelete(ProdctVO prodctVO) throws Exception{
		adminProdctDao.prodctColorDelete(prodctVO);
	}
}
