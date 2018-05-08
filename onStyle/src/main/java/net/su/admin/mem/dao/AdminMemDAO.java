package net.su.admin.mem.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.admin.mem.vo.AdminMemVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;

@Repository
public class AdminMemDAO extends SqlSessionDaoSupport{
	
	public List<AdminMemVO> adminMemList(AdminMemVO adminMemVO) throws Exception{
		List<AdminMemVO> adminMemList = getSqlSession().selectList("adminMemMapper.adminMemList",adminMemVO);
		return adminMemList;
	}
	
	public int adminMemListCount(AdminMemVO adminMemVO)throws Exception{
		int adminMemListCount = getSqlSession().selectOne("adminMemMapper.adminMemListCount",adminMemVO );
		return adminMemListCount;
	}
	
	public AdminMemVO adminMemRead(AdminMemVO adminMemVO)throws Exception{
		adminMemVO = getSqlSession().selectOne("adminMemMapper.adminMemRead",adminMemVO);
		return adminMemVO;
	}
	
	public List<OrderBreakdwnVO> adminMemOrdrList(AdminMemVO adminMemVO) throws Exception{
		List<OrderBreakdwnVO> adminMemOrdrList = getSqlSession().selectList("adminMemMapper.adminMemOrdrList",adminMemVO);
		return adminMemOrdrList;
	}
}
