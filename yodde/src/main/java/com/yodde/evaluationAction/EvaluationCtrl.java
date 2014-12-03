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
		
	@RequestMapping(value = "/evaluation", method = RequestMethod.POST)
	public ModelAndView evaluation(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		int eval = Integer.parseInt(request.getParameter("eval"));
		EvaluationDto dto = new EvaluationDto();
		dto.setEval(eval);
		dto.setEvaluator(email);
		dto.setReviewId(reviewId);
		//System.out.println(email + "," + reviewId + "," + eval);
		
		int check = evaluationDao.evaluationCheck(email, reviewId);
		int value = 0;
		//no evaluation
		if (check == 0) {
			value = evaluationDao.insertEval(dto);
		}
		else {
			value = evaluationDao.deleteEval(dto);
		}
		
		check = evaluationDao.evaluationCheck(email, reviewId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", check);
		mav.setViewName("/result");
		
		return mav;
	}
}
