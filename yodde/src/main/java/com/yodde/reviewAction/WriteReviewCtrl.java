package com.yodde.reviewAction;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.pictureModel.PictureDao;
import com.yodde.pictureModel.PictureDto;
import com.yodde.reviewModel.Review;
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
	@Autowired
	PictureDao pictureDao;
	
	@RequestMapping(value = "/writeReivew", method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute ReviewDto reviewDto, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	
		//create response
		ModelAndView mav = new ModelAndView();
		ReviewDto review = new ReviewDto();
		review.setPic1(0);
		review.setPic2(0);
		review.setPic3(0);
		review.setPic4(0);
		review.setPic5(0);
		
		//request parse
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int rate = Integer.parseInt(request.getParameter("rate"));
		int	storeId	= Integer.parseInt(request.getParameter("storeId"));
		
		//file upload
		List<MultipartFile> files = reviewDto.getFiles();
		String filePath;
		String picturePath = "/Users/Min/git/yodde_spring/yodde/src/main/webapp";
		String filename;
		int index = 0;
		if (files != null){
			for (MultipartFile multipartFile : files) {
				if(multipartFile.getOriginalFilename().length() > 0) {
					index++;
					//확장자
					String ext = multipartFile.getOriginalFilename();
	    			ext = ext.substring(ext.length() - 4);
	    			int pictureId = pictureDao.getMaxPictureId() + 1;
	    			//pictureId + index 로 파일이름 작성
	    			filename = pictureId + "_" + index;
	    			filePath = "/resources/images/picture/" + filename + ext;
	    			File file = new File(picturePath + filePath);
	    			
	    			multipartFile.transferTo(file);
	    			
	    			PictureDto picture = new PictureDto();
	    			picture.setPath(filePath);
	    			picture.setStoreId(storeId);
	    			picture.setTag(null);
	    			
	    			int picId = pictureDao.insertPicture(picture);
	    			review.setPic(index, picId);
	    			//System.out.println(index +":" + picId);
	    			
	    			if(index == 5) break;
				}
            }
		}	
		
		//reivew DTO		
		review.setStoreId(storeId);
		review.setContent(content);
		review.setWriter(writer);
		review.setRate(rate);
		review.setLike1(0);
		review.setUnlike(0);
		review.setReport(0);
		
		
		//insert
		int check = reviewDao.insertReview(review);
		
		//select store;
		StoreDto storeDto = storeDao.selectStoreByStoreId(storeId);
		
		//select review : 원래 스토어가 있을때만 리뷰검색
		List<Review> reviewList = null;		
		reviewList = reviewDao.getReviewsByStoreId(storeDto.getStoreId());			
		
		//set response value
		mav.addObject("reviewList", reviewList);
		mav.addObject("storeDto", storeDto);
		mav.addObject("check", check);
		mav.setViewName("/store/storeInfo");
		
		return mav;
		
	}

}
