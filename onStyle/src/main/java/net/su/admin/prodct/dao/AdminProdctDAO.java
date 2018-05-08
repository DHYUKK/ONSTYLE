package net.su.admin.prodct.dao;

import java.util.ArrayList;
import java.util.List;

import net.su.admin.prodct.vo.AdminProdctVO;
import net.su.consmr.prodct.vo.ProdctVO;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Repository
public class AdminProdctDAO extends SqlSessionDaoSupport{
	
	public ProdctVO selectProdctCode() throws Exception {
		ProdctVO prodctVO = new ProdctVO();
		prodctVO = getSqlSession().selectOne("adminProdctMapper.selectProdctCode");
        return prodctVO;
     }
	
	public void adminProdctInsert(ProdctVO prodctVO) throws Exception {
		//상품 등록
		getSqlSession().insert("adminProdctMapper.prodctInsert", prodctVO);
		System.out.println("에디터확인 : "+prodctVO.getProdct_detail());
		//상품 사이즈 등록
		getSqlSession().insert("adminProdctMapper.prodctSizeInsert", prodctVO);
		System.out.println("ASDFA");
		//진열테이블 등록
		if(prodctVO.getProdct_disply_state().equals("Y")){
			getSqlSession().insert("adminProdctDisplyInsert", prodctVO);
		}
        
     }
	public void prodctSizeInsert(ProdctVO prodctVO) throws Exception{
		getSqlSession().insert("adminProdctMapper.prodctSizeInsert", prodctVO);
	}
	public List<ProdctVO> selectTempSizetList(ProdctVO prodctVO) throws Exception{
		System.out.println("이게 왜 오지?" + prodctVO.getProdct_seq());
		//size 임시등록
		if(prodctVO.getTop_size_nme() != null || prodctVO.getBottom_size_nme() != null){
			System.out.println("등록 조건 돈다 조건 돈다");
			getSqlSession().insert("adminProdctMapper.insertTempSize", prodctVO);
		}
		//임시 size리스트
		List<ProdctVO> TempSizeList = getSqlSession().selectList("adminProdctMapper.selectTempSizeList", prodctVO);
		return TempSizeList;
	}
	//임시사이즈삭제
	public void deleteTempSize(ProdctVO prodctVO) throws Exception{
		getSqlSession().delete("adminProdctMapper.deleteTempSize", prodctVO);
	}
	//거래처 조회
	public List<ProdctVO> selectClientList() throws Exception{
		List<ProdctVO> clientList = getSqlSession().selectList("adminProdctMapper.selectClientList");
		return clientList;
	}
	public void adminProdctColorInsert(ProdctVO prodctVO) throws Exception{
		getSqlSession().delete("adminProdctMapper.prodctColorDelete", prodctVO);
		getSqlSession().insert("adminProdctMapper.adminProdctColorInsert", prodctVO);
	}
	public void updateTempSizeInsert(ProdctVO prodctVO) throws Exception{
		getSqlSession().insert("adminProdctMapper.updateTempSizeInsert", prodctVO);
	}
	public void prodctUpdate(ProdctVO prodctVO) throws Exception{
		//상품 업데이트
		getSqlSession().update("adminProdctMapper.prodctUpdate", prodctVO);
		//기존 상품 사이즈 삭제
		getSqlSession().delete("adminProdctMapper.prodctSizeDelete", prodctVO);
		System.out.println("상품 사이즈 등록 성공");
		//새로운 상품 사이즈 등록
		getSqlSession().insert("adminProdctMapper.prodctSizeInsert", prodctVO);
		//임시 사이즈 삭제
//		getSqlSession().delete("adminProdctMapper.deleteTempSize", prodctVO);
	}
	public void prodctColorDelete(ProdctVO prodctVO) throws Exception{
		getSqlSession().delete("adminProdctMapper.prodctColorDelete", prodctVO);
	}
}
