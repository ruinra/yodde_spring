package com.yodde.storeAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Component
public class StoreInfoCtrl {
	// @Autowired

	@RequestMapping(value = "/storeInfo", method=RequestMethod.GET)
	public ModelAndView storeInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String title=request.getParameter("title");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("title", title);
		mav.setViewName("/store/storeInfo");
		
		return mav;
	}
}
