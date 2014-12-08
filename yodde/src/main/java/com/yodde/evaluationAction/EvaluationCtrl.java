package com.yodde.evaluationAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.evaluationModel.EvaluationDao;
import com.yodde.evaluationModel.EvaluationDto;

@Component
@Controller
public class EvaluationCtrl {
   @Autowired
   private EvaluationDao   evaluationDao;
      
   @RequestMapping(value = "/evaluation", method = RequestMethod.POST)
   public ModelAndView evaluation(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      String email = request.getParameter("email");
      int reviewId = Integer.parseInt(request.getParameter("reviewId"));
      int eval = Integer.parseInt(request.getParameter("eval"));
      //System.out.println("evaluation : " + email + "," + reviewId + "," + eval);   //OK
      
      int check = evaluationDao.evaluationCheck(email, reviewId);
      //System.out.println("EvaluationCtrl evaluation check : " + check);
      
      EvaluationDto dto = new EvaluationDto();
      dto.setEval(eval);
      dto.setEvaluator(email);
      dto.setReviewId(reviewId);
      

      //no evaluation
      int value = 0;
      if(check == 0){            /*DB에 없을 떄*/
         value = evaluationDao.insertEval(dto);
         //System.out.println(value);
      }else{                  /*DB에 있을 떄*/
         value = evaluationDao.deleteEval(dto);
      }
      
      List<EvaluationDto> evalDto   = null;
      evalDto = evaluationDao.selectList(email, reviewId);
      
      check = evaluationDao.evaluationCheck(email, reviewId);
      
      ModelAndView mav = new ModelAndView();
      //mav.addObject("eval", evalDto);
      mav.addObject("result", check);
      mav.setViewName("/result");
      
      return mav;
   }
}