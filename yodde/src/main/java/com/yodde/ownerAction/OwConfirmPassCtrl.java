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

import com.yodde.ownerModel.OwnerDto;
import com.yodde.ownerModel.OwnerDao;


@Component
@Controller
public class OwConfirmPassCtrl {
   @Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   private OwnerDao ownerDao;

   @RequestMapping(value = "info/OwPasswordConfirm", method=RequestMethod.GET)
      public ModelAndView confirm(@ModelAttribute OwnerDto ownerDto, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String email=request.getParameter("email");
        System.out.println(email);
        
        ownerDto=ownerDao.selectOwner(email);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("ownerDto", ownerDto);
        mav.setViewName("/owner/owConfirmPass");
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