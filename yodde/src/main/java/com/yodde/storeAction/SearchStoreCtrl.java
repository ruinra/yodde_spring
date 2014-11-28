package com.yodde.storeAction;

import java.util.List;
import java.util.StringTokenizer;

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
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;

@Component
@Controller
public class SearchStoreCtrl {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private StoreDao storeDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private PictureDao pictureDao;
	
	@RequestMapping(value = "/getStoreInfo", method=RequestMethod.GET)
	public ModelAndView getStoreInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//create response
		ModelAndView mav = new ModelAndView();
		//parse request
		String title = request.getParameter("title");
		//title tag delete
		title = title.replaceAll("<b>", "");
		title = title.replaceAll("</b>", "");
		
		//category tokenize
		StringTokenizer st = new StringTokenizer(request.getParameter("category"), ">");
		
		String[] arrCategory = new String[]{"", "", ""};
		
		for (int i = 0; i < 3; i++){
			arrCategory[i] = st.nextToken();
			//System.out.println(arrCategory[i]);
			if (!st.hasMoreTokens()) break;
		}
		
		//create dto
		StoreDto storeDto = new StoreDto();
		storeDto.setStoreName(title);
		storeDto.setCategory1(arrCategory[0]);
		storeDto.setCategory2(arrCategory[1]);
		storeDto.setCategory3(arrCategory[2]);
		storeDto.setPhoneNum(request.getParameter("telephone"));
		storeDto.setAddress(request.getParameter("address"));
		storeDto.setStreetAddr(request.getParameter("roadAddress"));
		storeDto.setLatitude(Long.parseLong(request.getParameter("mapx")));
		storeDto.setLongitude(Long.parseLong(request.getParameter("mapy")));
		storeDto.setOpenDate(null);
		
		//선택한 스토어가 데이터베이스에 있는지 확인
		int storeId = storeDao.isExistStore(storeDto);
		int check = 0;
		
		if (storeId == 0) {
			//insert store
			check = storeDao.insertStore(storeDto);
			storeId = storeDao.isExistStore(storeDto);
		} else {
			check = 2;
		}		
		//select store;
		//System.out.println(check + "," + storeId);
		storeDto = storeDao.selectStoreByStoreId(storeId);
		
		//select review : 원래 스토어가 있을때만 리뷰검색 : 사진검색
		List<Review> reviewList = null;
		List<PictureDto> pictureList = null;
		if (check == 2) {			
			reviewList = reviewDao.getReviewsByStoreId(storeDto.getStoreId());	
			pictureList = pictureDao.select7Picture(storeDto.getStoreId());
		}
		
		//set response value
		mav.addObject("reviewList", reviewList);
		mav.addObject("pictureList", pictureList);
		mav.addObject("storeDto", storeDto);
		mav.addObject("check", check);
		mav.setViewName("/store/storeInfo");
		
		return mav;
	}
	
	@RequestMapping(value = "/searchStore", method = RequestMethod.GET)
	public ModelAndView searchStore(HttpServletRequest request,
			HttpServletResponse response) throws Exception {         
		String query=request.getParameter("query");
		  
		ModelAndView mav = new ModelAndView();
		mav.addObject("query", query);
		mav.setViewName("/search/findStore");
		      
		return mav;
	}
	   
	@RequestMapping(value = "/proxy", method = RequestMethod.GET)
	public ModelAndView proxy(HttpServletRequest request,
				HttpServletResponse response) throws Exception {      
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/store/api_proxy");
		return mav;
	}
}
