package com.yodde.evaluationAction;

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
	private EvaluationDao	evaluationDao;
	
	@RequestMapping(value = "/evaluationCheck", method = RequestMethod.GET)
	public ModelAndView like(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		
		System.out.println(email + "," + reviewId);
		
		EvaluationDto eval = null;
//		if (email != null){
//			eval = evaluationDao.evaluationCheck(email, reviewId);
//		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", eval);
		mav.setViewName("/result");
		
		return mav;
	}
}
