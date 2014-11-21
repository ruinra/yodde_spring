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
public class UpdateStoreCtrl {
	//@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	/*
	@RequestMapping(value = "", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return null;
	}
	*/
}
