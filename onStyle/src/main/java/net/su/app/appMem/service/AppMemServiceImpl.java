package net.su.app.appMem.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.app.appCodi.service.AppCodiReqstService;
import net.su.app.appMem.dao.AppMemDAO;
import net.su.logger.Logger;

@Service
public class AppMemServiceImpl implements AppMemService{

	@Resource	
	AppMemDAO appMemDao;
}
