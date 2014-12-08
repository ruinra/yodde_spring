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

import com.yodde.memberModel.MemberDao;
import com.yodde.memberModel.MemberDto;


@Component
@Controller
public class ConfirmPassCtrl {
   @Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   private MemberDao memberDao;

   @RequestMapping(value = "/info/passwordConfirm", method=RequestMethod.GET)
      public ModelAndView confirm(@ModelAttribute MemberDto memberDto, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String email=request.getParameter("email");
        System.out.println(email);
        
        memberDto=memberDao.selectMember(email);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("memberDto", memberDto);
        mav.setViewName("/member/confirmPass");
         return mav;
      }
   
//@RequestMapping(value = "/info/passwordConfirm", method=RequestMethod.POST)
//   public ModelAndView confirmPass(HttpServletRequest request,
//      HttpServletResponse response) throws Exception {
//      
//      String email=request.getParameter("email");
//      System.out.println(email);
//      
//      MemberDto memberDto = new MemberDto();
//      
//         
//      System.out.println("confirmPass:"+check);
//      ModelAndView mav = new ModelAndView();
//      mav.addObject("check", check);
//      mav.setViewName("/common/confirmPass");
//      
//      return null;
//   }
}