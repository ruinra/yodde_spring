package com.yodde.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.reviewModel.ReviewDao;

@Component
@Controller
public class MemberHistoryCtrl {
	@Autowired
	private ReviewDao reviewDao;
	
//	
//	@RequestMapping(value = "/info/history", method=RequestMethod.GET)
//	public ModelAndView handleRequest(HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//
//		return null;
//	}

}
