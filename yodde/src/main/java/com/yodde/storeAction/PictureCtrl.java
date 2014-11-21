package com.yodde.storeAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class PictureCtrl {
	@RequestMapping(value = "/morePicture", method = RequestMethod.GET)
	public ModelAndView searchStore(HttpServletRequest request,
			HttpServletResponse response) throws Exception {         
		int storeId = Integer.parseInt(request.getParameter("storeId"));
		String storeName = request.getParameter("storeName");
		//System.out.println(storeId);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("storeName", storeName);
		mav.setViewName("/store/picCollection");
		      
		return mav;
	}
}
