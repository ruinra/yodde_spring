package com.yodde.storeAction;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.yodde.pictureModel.PictureDto;
import com.yodde.reviewModel.Review;
import com.yodde.reviewModel.ReviewDao;
import com.yodde.storeModel.FollowReview;
import com.yodde.storeModel.FollowStore;
import com.yodde.storeModel.LikeDto;
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;

@Component
@Controller
public class MainAjax {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private StoreDao storeDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private PictureDao pictureDao;
	
	@RequestMapping(value = "MainAjax", method=RequestMethod.GET)
	public ModelAndView newOpen(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String email=request.getParameter("email");
		//System.out.println(email);
		
		if(email != null){
			StoreDto storeDto=new StoreDto();
			List<StoreDto> newStoreList=null;
			
			newStoreList=storeDao.selectNewOpen();
			//System.out.println(storeList);
			String[] openDay = new String[6];
//			String openDate=null;
			for(int i=0;i<newStoreList.size();i++){
				storeDto=newStoreList.get(i);
				
				Date from = new Date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String openDate = transFormat.format(storeDto.getOpenDate());
				
				openDay[i]=openDate;
			}
			
//			for(int i=0;i<openDay.length;i++){
//				System.out.println(openDay[i]);
//			}
			
			List<StoreDto> hotList=null;
			hotList=storeDao.selectHotPlace();
			
			List<LikeDto> likeList=null;
			likeList=storeDao.selectLike();
			
			List<FollowReview> followList=null;
			followList=storeDao.selectFollowReview(email);
			
			List<FollowStore> followStoreList=null;
			followStoreList=storeDao.selectFollowStoreReview(email);
			
			mav.addObject("openDay", openDay);
			mav.addObject("newStoreList", newStoreList);
			mav.addObject("hotplaceList", hotList);
			mav.addObject("likeList", likeList);
			mav.addObject("followReview", followList);
			mav.addObject("followStoreList", followStoreList);
	        mav.setViewName("jsonView");
	        
		}else{
			StoreDto storeDto=new StoreDto();
			List<StoreDto> newStoreList=null;
			
			newStoreList=storeDao.selectNewOpen();
			//System.out.println(storeList);
			String[] openDay = new String[6];
//			String openDate=null;
			for(int i=0;i<newStoreList.size();i++){
				storeDto=newStoreList.get(i);
				
				Date from = new Date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String openDate = transFormat.format(storeDto.getOpenDate());
				
				openDay[i]=openDate;
			}
			
//			for(int i=0;i<openDay.length;i++){
//				System.out.println(openDay[i]);
//			}
			
			List<StoreDto> hotList=null;
			hotList=storeDao.selectHotPlace();
			
			List<LikeDto> likeList=null;
			likeList=storeDao.selectLike();
			
			mav.addObject("openDay", openDay);
			mav.addObject("newStoreList", newStoreList);
			mav.addObject("hotplaceList", hotList);
			mav.addObject("likeList", likeList);
	        mav.setViewName("jsonView");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "AjaxStore", method=RequestMethod.GET)
	public ModelAndView newStore(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int storeId=Integer.parseInt(request.getParameter("storeId"));
		//System.out.println(storeId);
		
		StoreDto storeDto=new StoreDto();
		
		storeDto=storeDao.selectStoreByStoreId(storeId);
		
		List<Review> reviewList = null;
		List<PictureDto> pictureList = null;
		reviewList = reviewDao.getReviewsByStoreId(storeDto.getStoreId());	
		pictureList = pictureDao.select7Picture(storeDto.getStoreId());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(storeDto);
		mav.addObject("reviewList", reviewList);
		mav.addObject("pictureList", pictureList);
        mav.setViewName("/store/storeInfo");
        		
		return mav;
	}
		
}
