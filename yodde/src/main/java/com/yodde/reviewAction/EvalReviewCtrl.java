package com.yodde.reviewAction;

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
public class EvalReviewCtrl {
   //@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   
   @RequestMapping(value = "/reportReview", method=RequestMethod.GET)
   public ModelAndView report(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      String writer=request.getParameter("writer");
//      System.out.println(writer);
      String content=request.getParameter("content");
//      System.out.println(content);
            
            
      ModelAndView mav=new ModelAndView();
      mav.addObject("writer", writer);
      mav.addObject("content", content);
      
      
      mav.setViewName("/store/reportReview");
      return mav;
   }

   @RequestMapping(value = "/reportReview", method=RequestMethod.POST)
   public ModelAndView reportPost(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
//      String reportNick=request.getParameter("reportNick");
//      System.out.println(reportNick);
//      String reviewContent=request.getParameter("reviewContent");
//      System.out.println(reviewContent);
//      String reasonContent=request.getParameter("reasonContent");
//      System.out.println(reasonContent);
      
      String reportNick=request.getParameter("reportNick");
      String reviewContent=request.getParameter("reviewContent");
      String reasonContent=request.getParameter("reasonContent");
      
      MailService ms = new MailServiceImpl();
      MailConfig mc = new MailConfig();
      ms.setMailSender(mc.mailSender());
      int isOk= ms.sendMail("[리뷰신고]"+reportNick,"회원 닉네임:"+ reportNick + " //리뷰내용: " + reviewContent + "//사유:" + reasonContent, "yodde.test@gmail.com", null);  
      
      ModelAndView mav=new ModelAndView();
      mav.setViewName("/store/reportReview");
      return mav;
      
      
   }

   
}