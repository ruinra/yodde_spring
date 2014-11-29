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
		
		
		ModelAndView mav=new ModelAndView();
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
	
	@RequestMapping(value = "/member/followMemberCheck", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView checkFollowMember(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 로그인 follower, following를 받아온다
		String follower=request.getParameter("follower");
		String following=request.getParameter("following");
		//System.out.println(email + "," + store);
		
		int check=relationDao.checkFollowMember(follower, following);
		//System.out.println(check);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
	
	@RequestMapping(value = "/member/followMember", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView follow(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String follower = request.getParameter("follower");
		String following = request.getParameter("following");
		
		int check = relationDao.checkFollowMember(follower, following);
		//System.out.println(check);
		
		if(check == 1){
			check = relationDao.unfollowMember(follower, following);
		}else if(check == 0){
			check = relationDao.followMember(follower, following);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
	
}
