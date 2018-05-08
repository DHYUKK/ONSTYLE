package net.su.admin.mem.service;

import java.util.List;

import net.su.admin.mem.vo.AdminMemVO;
import net.su.consmr.ordr.vo.OrderBreakdwnVO;

public interface AdminMemService {
	List<AdminMemVO>adminMemList(AdminMemVO adminMemVO) throws Exception; //회원리스트 조회
	AdminMemVO adminMemRead(AdminMemVO adminMemVO) throws Exception;//회원 상세조회
	List<OrderBreakdwnVO> adminMemOrdrList(AdminMemVO adminMemVO) throws Exception; // 회원 주문내역
}
