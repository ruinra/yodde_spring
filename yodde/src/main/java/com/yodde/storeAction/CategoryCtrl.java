package com.yodde.storeAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.reviewModel.Review;
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;

@Component
@Controller
public class CategoryCtrl {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private StoreDao storeDao;
	
	@RequestMapping(value = "/categorySearch", method=RequestMethod.GET)
	public ModelAndView category(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String categoryName = request.getParameter("category");
		String categoryLevel =request.getParameter("categoryLevel");
		//System.out.println(categoryName);
		//System.out.println(categoryLevel);
		
		List<StoreDto> storeList = null;
		storeList = storeDao.selectStoreByCategory(categoryLevel, categoryName);
		//System.out.println("CategoryCtrl = "+storeList);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryLevel", categoryLevel);
		mav.addObject("categoryName", categoryName);
		mav.addObject("storeDto", storeList);
		mav.setViewName("/main/resultStore");
		 
		return mav;
	}
}