package net.su.app.appLogin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.app.appCodi.service.AppCodiReqstService;
import net.su.app.appLogin.dao.AppLoginDAO;
import net.su.logger.Logger;

@Service
public class AppLoginServiceImpl implements AppLoginService{

	@Resource	
	AppLoginDAO appLoginDao;
}
