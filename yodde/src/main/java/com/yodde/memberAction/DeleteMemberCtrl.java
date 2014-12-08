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
import com.yodde.memberModel.MemberDto;
import com.yodde.mail.MailConfig;
import com.yodde.mail.MailService;
import com.yodde.mail.MailServiceImpl;


@Component
@Controller
public class DeleteMemberCtrl {
   @Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   private MemberDao memberDao;

   @RequestMapping(value = "/info/deleteMember", method=RequestMethod.GET)
      public ModelAndView delete(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
      String email=request.getParameter("email");
      
        ModelAndView mav = new ModelAndView();
        mav.addObject(email); 
        mav.addObject("check", 2);
         mav.setViewName("/member/deleteMember");
         return mav;
      }
   
@RequestMapping(value = "/info/deleteMember", method=RequestMethod.POST)
   public ModelAndView deleteMember(HttpServletRequest request,
      HttpServletResponse response) throws Exception {
      
      String email=request.getParameter("email");
      String password=request.getParameter("password");
      System.out.println(email + "," + password);
      MemberDto memberDto = new MemberDto();
      memberDto.setEmail(email);
      memberDto.setPassword(password);
      
      int check = memberDao.memberDelete(memberDto);
         
      System.out.println("memberDelete:"+check);
      ModelAndView mav = new ModelAndView();
      mav.addObject("check", check);
      mav.setViewName("/member/deleteMember");
      
      return mav;
   }
}