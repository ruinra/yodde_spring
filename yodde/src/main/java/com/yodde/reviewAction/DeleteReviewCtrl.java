package com.yodde.reviewAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.reviewModel.ReviewDao;

@Component
@Controller
public class DeleteReviewCtrl {
   @Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   ReviewDao reviewDao;
   
   @RequestMapping(value = "/deleteReview", method=RequestMethod.GET)
   public ModelAndView delete(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      int reviewId = Integer.parseInt(request.getParameter("reviewId"));
      //System.out.println(reviewId);
      int storeId = Integer.parseInt(request.getParameter("storeId"));
      System.out.println(storeId);
      
      int deleteCheck = reviewDao.deleteReveiw(reviewId, storeId);
      System.out.println("deleteCheck : " + deleteCheck);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("result", deleteCheck);
      mav.setViewName("/result");
      
      return mav;
   }
}