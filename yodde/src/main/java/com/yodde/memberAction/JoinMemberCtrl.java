package com.yodde.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yodde.memberModel.MemberDao;
import com.yodde.memberModel.MemberDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class JoinMemberCtrl {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private MemberDao memberDao;
	

	@RequestMapping(value = "/member/join", method=RequestMethod.GET)
	public ModelAndView join(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/join");
		return mav;
	}
	
	@RequestMapping(value = "/member/memberJoin", method=RequestMethod.GET) //join.jsp에서 들어올때
	public ModelAndView memberJoin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberJoin");
		return mav;
	}
	
	@RequestMapping(value = "/member/memberJoin", method=RequestMethod.POST) //memberJoin.jsp에서 데이터값 넘어올때
	public ModelAndView memberJoinOk(@ModelAttribute MemberDto memberDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String nickname=request.getParameter("name");
		
		memberDto.setEmail(email);
		memberDto.setPassword(password);
		memberDto.setNickName(nickname);
		memberDto.setMemberLv(0);
		memberDto.setZipcode("1");
		//System.out.println(email + "," + password + "," + nickname); 
		
		int check = memberDao.memberJoin(memberDto);
		int checkAuth = memberDao.memberJoinAuth(memberDto);
		//System.out.println(check);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("check", check);
		mav.addObject("checkAuth", checkAuth);
		mav.setViewName("/common/login");
		
		return mav;
	}
}
