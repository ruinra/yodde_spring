package com.yodde.storeAction;

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


@Component
@Controller
public class RegisterStoreCtrl {
   //@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   

   @RequestMapping(value = "/requestRegStore", method=RequestMethod.GET)
      public ModelAndView requestRegStore(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
         
        ModelAndView mav = new ModelAndView();
         mav.setViewName("/search/storeRegInfo");
         return mav;
      }
   
@RequestMapping(value = "/requestRegStore", method=RequestMethod.POST)
   public ModelAndView requestRegStorePost(HttpServletRequest request,
      HttpServletResponse response) throws Exception {
//         String nickName=request.getParameter("nick");
//         System.out.println(nickName);
//         String storeName=request.getParameter("storeName");
//         System.out.println(storeName);
//         String address=request.getParameter("address");
//         System.out.println(address);
      String nickName=request.getParameter("nick");
      String storeName=request.getParameter("storeName");
      String address=request.getParameter("address");
      
      MailService ms = new MailServiceImpl();
      MailConfig mc = new MailConfig();
      ms.setMailSender(mc.mailSender());
      int isOk= ms.sendMail("[등록요청]"+nickName,"회원 닉네임:"+ nickName + " //상호명: " + storeName + "//상점주소:" + address, "yodde.test@gmail.com", null);  
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("");
      return mav;
   }
}