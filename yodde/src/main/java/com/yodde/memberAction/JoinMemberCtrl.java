package com.yodde.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.mail.MailConfig;
import com.yodde.mail.MailService;
import com.yodde.mail.MailServiceImpl;
import com.yodde.memberModel.MemberDao;
import com.yodde.memberModel.MemberDto;

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
	
	@RequestMapping(value = "/verification", method=RequestMethod.GET) //join.jsp에서 들어올때
	public ModelAndView verification(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		int verificationCode = Integer.parseInt(request.getParameter("code"));
		MemberDto memberDto = new MemberDto();
		memberDto.setEmail(email);
		
		int checkAuth = memberDao.memberJoinAuth(memberDto);
		String msg = "";
		if (checkAuth == 1){
			msg = "인증이 완료되었습니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("/common/login");
		return mav;
	}
	
	@RequestMapping(value = "/member/memberJoin", method=RequestMethod.POST) //memberJoin.jsp에서 데이터값 넘어올때
	public ModelAndView memberJoinOk(@ModelAttribute MemberDto memberDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String nickname=request.getParameter("name");
		String zipcode = request.getParameter("zip1") + "-" + request.getParameter("zip2");
		
		memberDto.setEmail(email);
		memberDto.setPassword(password);
		memberDto.setNickName(nickname);
		memberDto.setMemberLv(0);
		memberDto.setZipcode(zipcode);
		memberDto.setProfilePic("/resources/images/profile/noname.png");
		//System.out.println(email + "," + password + "," + nickname); 
		//verification code insert
		int code = (int)(Math.random() * 10000000);
		memberDto.setVerificationCode(code);
		//verification code mail sender
		MailService ms = new MailServiceImpl();
		MailConfig mc = new MailConfig();
		ms.setMailSender(mc.mailSender());
		
		String content = "<a href='localhost:8080/home/verification?code=" + code +"&email="+email+">localhost:8081/home/verification?code="+code+"<a>";
		//String content = "<a href='www.naver.com'>localhost:8081/lake/verification?code="+code+"<a>";
		int isOk = ms.sendMail("[요때]회원가입 인증메일입니다.", content, email, null);
		String msg;
		int check = 0;
		if (isOk == 0){
			check = memberDao.memberJoin(memberDto);
			msg = "회원 인증메일이 발송되었습니다. 인증 후 로그인 하실 수 있습니다.";
		} else {
			msg = "회원 가입에 실패 했습니다. 다시 시도해주세요.";
		}
		
		//int checkAuth = memberDao.memberJoinAuth(memberDto);
		//System.out.println(check);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("check", check);
		mav.addObject("msg", msg);
		mav.setViewName("/common/login");
		
		return mav;
	}
}