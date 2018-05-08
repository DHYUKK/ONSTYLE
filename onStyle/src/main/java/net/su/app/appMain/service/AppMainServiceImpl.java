package net.su.app.appMain.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.app.appCodi.service.AppCodiReqstService;
import net.su.app.appMain.dao.AppMainDAO;
import net.su.logger.Logger;

@Service
public class AppMainServiceImpl implements AppMainService{

	@Resource	
	AppMainDAO appMainDao;
}
