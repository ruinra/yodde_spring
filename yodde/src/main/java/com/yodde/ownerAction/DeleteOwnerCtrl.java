package com.yodde.ownerAction;

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
import com.yodde.ownerModel.OwnerDao;
import com.yodde.ownerModel.OwnerDto;


@Component
@Controller
public class DeleteOwnerCtrl {
   @Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   private OwnerDao ownerDao;

   @RequestMapping(value = "/info/deleteOwner", method=RequestMethod.GET)
      public ModelAndView delete(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
      String email=request.getParameter("email");
      
        ModelAndView mav = new ModelAndView();
        mav.addObject(email);
        mav.addObject("check" , 2);
         mav.setViewName("/owner/deleteOwner");
         return mav;
      }
   
@RequestMapping(value = "/info/deleteOwner", method=RequestMethod.POST)
   public ModelAndView deleteOwner(HttpServletRequest request,
      HttpServletResponse response) throws Exception {
      
      String email=request.getParameter("email");
      String password=request.getParameter("password");
      System.out.println(email + "," + password);
      OwnerDto ownerDto = new OwnerDto();
      ownerDto.setEmail(email);
      ownerDto.setPassword(password);
      
      int check = ownerDao.deleteOwner(ownerDto);
      
      System.out.println("ownerDelete:"+check);
      ModelAndView mav = new ModelAndView();
      mav.addObject("check" , check);
      mav.setViewName("/owner/deleteOwner");
      
      return mav;
   }
}