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
public class MemberRelationCtrl {
	@Autowired
	private RelationDao	relationDao;
	
	@RequestMapping(value = "/info/followerList", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView followerList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		System.out.println(email);
		
		ModelAndView mav=new ModelAndView();
//		mav.addObject("followerList", list);
		mav.setViewName("/relation/followerList");
		
		return mav;
	}
	
	@RequestMapping(value = "/info/followingList", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView followingList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/relation/followingList");
		
		return mav;
	}
	
	@RequestMapping(value = "/info/history", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView history(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/relation/historyMap");
		
		return mav;
	}
	
	
}
