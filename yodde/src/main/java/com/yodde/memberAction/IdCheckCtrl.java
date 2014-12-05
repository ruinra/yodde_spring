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
public class IdCheckCtrl {
	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value="/member/idCheck", method=RequestMethod.GET)				/* 이멜일 중복확인 */
	public ModelAndView idcheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		// System.out.println(id);
		
		int check=memberDao.idCheck(email);
		// System.out.println(check);
		
//		|email.lastIndexOf(".b")==-1|email.lastIndexOf(".c")==-1|email.lastIndexOf(".d")==-1|email.lastIndexOf(".e")==-1|email.lastIndexOf(".f")==-1|email.lastIndexOf(".g")==-1|email.lastIndexOf(".h")==-1|email.lastIndexOf(".i")==-1|email.lastIndexOf(".j")==-1|email.lastIndexOf(".k")==-1|email.lastIndexOf(".l")==-1|email.lastIndexOf(".m")==-1|email.lastIndexOf(".n")==-1|email.lastIndexOf(".o")==-1|email.lastIndexOf(".p")==-1|email.lastIndexOf(".q")==-1|email.lastIndexOf(".r")==-1|email.lastIndexOf(".s")==-1|email.lastIndexOf(".t")==-1|email.lastIndexOf(".u")==-1|email.lastIndexOf(".v")==-1|email.lastIndexOf(".w")==-1|email.lastIndexOf(".x")==-1|email.lastIndexOf(".y")==-1|email.lastIndexOf(".z")==-1
		if(email.indexOf('@')==-1|email.indexOf('.')==-1|(email.lastIndexOf('a')==-1&&email.lastIndexOf('b')==-1&&email.lastIndexOf('c')==-1&&email.lastIndexOf('d')==-1&&email.lastIndexOf('e')==-1&&email.lastIndexOf('f')==-1&&email.lastIndexOf('g')==-1&&email.lastIndexOf('h')==-1&&email.lastIndexOf('i')==-1&&email.lastIndexOf('j')==-1&&email.lastIndexOf('k')==-1&&email.lastIndexOf('l')==-1&&email.lastIndexOf('m')==-1&&email.lastIndexOf('n')==-1&&email.lastIndexOf('o')==-1&&email.lastIndexOf('p')==-1&&email.lastIndexOf('q')==-1&&email.lastIndexOf('r')==-1&&email.lastIndexOf('s')==-1&&email.lastIndexOf('t')==-1&&email.lastIndexOf('u')==-1&&email.lastIndexOf('v')==-1&&email.lastIndexOf('w')==-1&&email.lastIndexOf('x')==-1&&email.lastIndexOf('y')==-1&&email.lastIndexOf('z')==-1)){
				check=3;
		}
		
		if(email.length()<6 || email.isEmpty()){
			check=3;
		}
		
//		System.out.println("email:" + email);
		ModelAndView mav=new ModelAndView();
		mav.addObject("check", check);
		mav.addObject("email", email);
		mav.setViewName("/member/idCheck");
		
		return mav;
	}

	@RequestMapping(value="/member/idCheck", method=RequestMethod.POST)
	public ModelAndView idcheck1(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String email=request.getParameter("email");
		// System.out.println(id);
		
		int check=memberDao.idCheck(email);
		// System.out.println(check);
		ModelAndView mav=new ModelAndView();
		mav.addObject("check", check);
		mav.addObject("email", email);
		mav.setViewName("/member/idCheck");
		
		return mav;
	}
}
