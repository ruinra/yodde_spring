package com.yodde.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
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
public class PasswordMailCtrl {
	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value="/passwordMail", method=RequestMethod.GET)		/* 닉네임 유효성 검사 */
	public ModelAndView passwordMail(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
				
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("/member/passwordMail");
		
		return mav;
	}
	
	@RequestMapping(value="/sendNewPasswordMail", method=RequestMethod.POST)		/* 닉네임 유효성 검사 */
	public ModelAndView sendPasswordMail(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		//System.out.println(email);		
		String msg = "";
		
		MemberDto member = memberDao.selectMember(email);
		
		if (member == null) {
			msg = "입력하신 E-mail 주소를 찾을 수 없습니다.";
		}
		else {
			int code = (int)(Math.random() * 10000000);
			member.setPassword(String.valueOf(code));
			memberDao.updateMember(member);
			
			MailService ms = new MailServiceImpl();
			MailConfig mc = new MailConfig();
			ms.setMailSender(mc.mailSender());
		
			int check = ms.sendMail("[요때]비밀번호찾기 메일입니다.", "비밀번호가 [" + code + "]로 변경되었습니다.", member.getEmail(), null);
			
			if (check == 0)
				msg = "새로운 패스워드가 이메일로 발송되었습니다.";
			else 
				msg = "알 수 없는 오류입니다.";
		}			
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("/common/login");
		
		return mav;
	}
}