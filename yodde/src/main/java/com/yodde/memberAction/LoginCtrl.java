package com.yodde.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.home.HomeController;

@Controller
public class LoginCtrl {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);  
    
	
    @RequestMapping(value="/signin", method = RequestMethod.GET)
    public String signin(@RequestParam(value="error", required=false) String error, Model model) {

         model.addAttribute("error", error);

         // Sha 암호값을 보기 위한 테스트용.
         //String guest_password = passwordEncoder.encodePassword("guest", null);
         //String admin_password = passwordEncoder.encodePassword("admin", null);

         return "login";
    }
    
    @PreAuthorize("authenticated")
    @RequestMapping(value="/loginSuccess", method = RequestMethod.GET)
    public String mypage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("user_name", auth.getName());
		
		return "success";
    }


    @RequestMapping(value="/denied", method = RequestMethod.GET)
    public String denied() {
         return "denied";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/common/login");
		
		return mav;
	}	
}
