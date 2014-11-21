package com.yodde.reviewAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.reviewModel.ReviewDao;
import com.yodde.reviewModel.ReviewDto;
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;

@Component
@Controller
public class WriteReviewCtrl {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입	
	ReviewDao reviewDao;
	@Autowired
	StoreDao storeDao;
	
	@RequestMapping(value = "/writeReivew", method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	
		//create response
		ModelAndView mav = new ModelAndView();
		
		//request parse
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int	storeId	= Integer.parseInt(request.getParameter("storeId"));
		
		//reivew DTO
		ReviewDto review = new ReviewDto();
		review.setStoreId(storeId);
		review.setContent(content);
		review.setWriter(writer);
		review.setRate(0);
		review.setLike1(0);
		review.setUnlike(0);
		review.setReport(0);
		review.setPic1(0);
		review.setPic2(0);
		review.setPic3(0);
		review.setPic4(0);
		review.setPic5(0);
		
		//insert
		int check = reviewDao.insertReview(review);
		
		//select store;
		StoreDto storeDto = storeDao.selectStoreByStoreId(storeId);
		
		//select review : 원래 스토어가 있을때만 리뷰검색
		List<ReviewDto> reviewList = null;		
		reviewList = reviewDao.getReviewsByStoreId(storeDto.getStoreId());			
		
		//set response value
		mav.addObject("reviewList", reviewList);
		mav.addObject("storeDto", storeDto);
		mav.addObject("check", check);
		mav.setViewName("/store/storeInfo");
		
		return mav;
		
	}

}
