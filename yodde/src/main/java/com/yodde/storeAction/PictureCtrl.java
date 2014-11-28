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

import com.yodde.pictureModel.PictureDao;
import com.yodde.pictureModel.PictureDto;

@Component
@Controller
public class PictureCtrl {
	@Autowired
	PictureDao pictureDao;
	
	@RequestMapping(value = "/morePicture", method = RequestMethod.GET)
	public ModelAndView searchStore(HttpServletRequest request,
			HttpServletResponse response) throws Exception {         
		int storeId = Integer.parseInt(request.getParameter("storeId"));
		String storeName = request.getParameter("storeName");
		//System.out.println(storeId);
		ModelAndView mav = new ModelAndView();
		
		List<PictureDto> pictureList = null;
		
		pictureList = pictureDao.selectListPicture(storeId);
		
		mav.addObject("storeName", storeName);
		mav.addObject("pictureList", pictureList);
		mav.setViewName("/store/picCollection");
		      
		return mav;
	}
}
