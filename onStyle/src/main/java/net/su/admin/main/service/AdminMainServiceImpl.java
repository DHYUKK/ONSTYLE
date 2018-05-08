package net.su.admin.main.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.admin.main.dao.AdminMainDAO;

@Service
public class AdminMainServiceImpl implements AdminMainService{

	@Resource
	private AdminMainDAO adminMainDao;
}
