package com.yodde.home;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.memberModel.MemberDao;
import com.yodde.memberModel.MemberDto;
import com.yodde.ownerModel.OwnerDao;
import com.yodde.ownerModel.OwnerDto;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private MemberDao memberDao;
	private MemberDto member;
	
	@Autowired
	private OwnerDao ownerDao;
	private OwnerDto owner;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request,
			HttpServletResponse response, Authentication auth) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/main");
		
		//login session
		if(auth != null) {
			//login ok
			//System.out.println(auth.getName());
			member = memberDao.selectMember(auth.getName());
			if (member != null) {
				mav.addObject("email", member.getEmail());
				mav.addObject("nick", member.getNickName());
				mav.addObject("profilePic", member.getProfilePic());
				mav.addObject("status", "member");
				
			}
			owner = ownerDao.selectOwner(auth.getName());
	         if (owner != null) {
               mav.addObject("email", owner.getEmail());
               mav.addObject("nick", owner.getStoreName());
               mav.addObject("profilePic", owner.getProfilePic());
               mav.addObject("status", "owner");
	         } 
			
		} else {
			//without login
			mav.addObject("email", "");
			mav.addObject("nick", "");
		}	
		
		return mav;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/main");
		
		return mav;
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/home");
		
		return mav;
	}
}
