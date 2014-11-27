package com.yodde.relationAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.relationModel.RelationDao;

@Component
@Controller
public class FollowStoreCtrl {
	@Autowired
	private RelationDao	relationDao;
	
	@RequestMapping(value = "/followStoreCheck", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView followCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 로그인 email, storeId를 받아온다
		String email=request.getParameter("email");
		String store=request.getParameter("storeId");
		//System.out.println(email + "," + store);
		
		int check=relationDao.checkFollowStore(store, email);
		//System.out.println(check);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
	
	@RequestMapping(value = "/followStore", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView follow(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 로그인 email, storeId를 받아온다
		String email=request.getParameter("email");
		String store=request.getParameter("storeId");
		//System.out.println(email + "," + store);
		
		int check = relationDao.checkFollowStore(store, email);
		//System.out.println(check);
		
		if(check == 1){
			check = relationDao.unfollowStore(store, email);
		}else if(check == 0){
			check = relationDao.followStore(store, email);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
}
