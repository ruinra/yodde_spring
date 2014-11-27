package com.yodde.ownerAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.ownerModel.OwnerDao;
import com.yodde.ownerModel.OwnerDto;

@Component
@Controller
public class ModifyOwnerCtrl {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private OwnerDao ownerDao;

	@RequestMapping(value = "/modifyOwner", method=RequestMethod.GET)
	public ModelAndView modifyOwner(@ModelAttribute OwnerDto ownerDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String email=request.getParameter("email");
		//System.out.println(email);
		
		ownerDto=ownerDao.selectOwner(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ownerDto", ownerDto);
		mav.setViewName("/owner/modifyStoreOwner");
		return mav;
	}
	
	@RequestMapping(value = "/modifyOwner", method=RequestMethod.POST)
	public ModelAndView modifyOwnerOk(@ModelAttribute OwnerDto ownerDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String password=request.getParameter("password");
		String file=request.getParameter("file");
		System.out.println(password + "," + file);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ownerDto", ownerDto);
		mav.setViewName("/owner/modifyStoreOwner");
		return null;
	}

}
