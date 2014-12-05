package com.yodde.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.memberModel.MemberDao;

@Component
@Controller
public class nickNameCheckCtrl {
	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value="/member/nickNameCheck", method=RequestMethod.GET)		/* 닉네임 유효성 검사 */
	public ModelAndView idcheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		// System.out.println(id);
		
		int check=memberDao.nickName(name);
		// System.out.println(check);
		if(name.length()<2 || name.isEmpty()){
			check=3;
		}
		if(name.equals("개새끼")|name.equals("씹새끼")|name.equals("미친놈")|name.equals("씨발놈")|name.equals("좆")|name.equals("씹")|name.equals("미친년")|name.equals("씹쌔")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")|name.equals("")){
			check=2;
		}

		System.out.println("nickName:" + name);
		ModelAndView mav=new ModelAndView();
		mav.addObject("check", check);
		mav.addObject("name", name);
		mav.setViewName("/member/nickNameCheck");
		
		return mav;
	}

	@RequestMapping(value="/member/nickNameCheck", method=RequestMethod.POST)
	public ModelAndView idcheck1(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		
		int check=memberDao.idCheck(name);

		ModelAndView mav=new ModelAndView();
		mav.addObject("check", check);
		mav.addObject("name", name);
		mav.setViewName("/member/nickNameCheck");
		
		return mav;
	}
}
