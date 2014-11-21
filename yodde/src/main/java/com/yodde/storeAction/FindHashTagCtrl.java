package com.yodde.storeAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class FindHashTagCtrl {
	//@Autowired

	@RequestMapping(value = "/search/searchTag", method=RequestMethod.GET) //searchbar.jsp에서 들어올때
	public ModelAndView findHasgTag(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String query="asdf";
		query=request.getParameter("query");
		System.out.println(query);
		System.out.println("아아아");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("query", query);
		mav.setViewName("/search/searchTag");
		
		return mav;
	}
}
