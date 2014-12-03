package com.yodde.memberAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.pictureModel.PictureDao;
import com.yodde.reviewModel.Review;
import com.yodde.reviewModel.ReviewDao;
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;

@Component
@Controller
public class MemberHistoryCtrl {
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private PictureDao pictureDao;
	@Autowired
	StoreDao storeDao;

	@RequestMapping(value = "/info/memHistory", method = RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 스토어 이메일 받아서 별점 보내주는 부
		String email = request.getParameter("email");
		double average = reviewDao.averageRate(email);
		String avg = String.format("%.1f", average);
		
		// 리뷰들 받아오는 부분
		// select review : 원래 스토어가 있을때만 리뷰검색 : 사진검색
		int check = 0;
		
		List<Review> reviewList = null;
		// List<PictureDto> pictureList = null;
		reviewList = reviewDao.getReviewByWriter(email);

		
		List<StoreDto> nameList;
		nameList=storeDao.selectRecentReviewName(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("average", avg); // 평균평점 값
		mav.addObject("reviewList", reviewList);
		mav.addObject("nameList", nameList);
		// mav.addObject("pictureList", pictureList);

		mav.setViewName("/relation/historyMap");

		return mav;
	}

}
