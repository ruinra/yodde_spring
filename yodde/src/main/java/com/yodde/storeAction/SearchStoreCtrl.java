package com.yodde.storeAction;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
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

import com.yodde.evaluationModel.EvaluationDao;
import com.yodde.pictureModel.PictureDao;
import com.yodde.pictureModel.PictureDto;
import com.yodde.reviewModel.Review;
import com.yodde.reviewModel.ReviewDao;
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;
import com.yodde.storeModel.StoreInfoDto;

@Component
@Controller
public class SearchStoreCtrl {
   @Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   private StoreDao storeDao;
   @Autowired
   private ReviewDao reviewDao;
   @Autowired
   private PictureDao pictureDao;
   @Autowired
   private EvaluationDao evaluationDao;
   
   @RequestMapping(value = "/getStoreInfo", method=RequestMethod.GET)
   public ModelAndView getStoreInfo(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      //create response
      ModelAndView mav = new ModelAndView();
      //parse request
      String title = request.getParameter("title");
//      int storeId=Integer.parseInt(request.getParameter("storeId"));
      
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
      storeDto.setLatitude(Double.parseDouble(request.getParameter("mapx")));
      storeDto.setLongitude(Double.parseDouble(request.getParameter("mapy")));
      
      String date="0000-00-00";
      DateFormat transDay=new SimpleDateFormat("yyyy-MM-dd"); 
      Date openDay=transDay.parse(date);
      
      storeDto.setOpenDate(openDay);
      
      //선택한 스토어가 데이터베이스에 있는지 확인
      int storeId = storeDao.isExistStore(storeDto);
      int check = 0;
      
      if (storeId == 0) {
         //insert store
         check = storeDao.insertStore(storeDto);
         storeId = storeDao.isExistStore(storeDto);
         storeDao.insertStoreInfo(storeId);
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
      
      StoreInfoDto storeInfo=new StoreInfoDto();
      storeInfo=storeDao.selectStoreInfo(storeId);
      
      
      //set response value
      mav.addObject("storeInfo", storeInfo);
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
   
   @RequestMapping(value = "/searchStoreByStoreInfo", method = RequestMethod.GET)
   public ModelAndView searchStoreByStoreInfo(HttpServletRequest request,
         HttpServletResponse response) throws Exception {         
	   
      String query=request.getParameter("query");
      StringTokenizer store = new StringTokenizer(request.getParameter("storeInfo"), " ");
      
//	  넘어온 애들만 배열에 1을 집어 넣는다      
      int[] storeInfo = new int[12];
      for(int i=0; i<storeInfo.length;i++){
    	  storeInfo[i]=2;
      }
      String token = "";
      while(store.hasMoreTokens()){
    	  token = store.nextToken();
    	  if(token.equalsIgnoreCase("reservation")){
    		  storeInfo[0] = 1;
    	  }else if(token.equalsIgnoreCase("delivery")){
    		  storeInfo[1] = 1;
    	  }else if(token.equalsIgnoreCase("takeout")){
    		  storeInfo[2] = 1;
    	  }else if(token.equalsIgnoreCase("card")){
    		  storeInfo[3] = 1;
    	  }else if(token.equalsIgnoreCase("parking")){
    		  storeInfo[4] = 1;
    	  }else if(token.equalsIgnoreCase("group")){
    		  storeInfo[5] = 1;
    	  }else if(token.equalsIgnoreCase("toilet")){
    		  storeInfo[6] = 1;
    	  }else if(token.equalsIgnoreCase("wifi")){
    		  storeInfo[7] = 1;
    	  }else if(token.equalsIgnoreCase("tv")){
    		  storeInfo[8] = 1;
    	  }else if(token.equalsIgnoreCase("seating")){
    		  storeInfo[9] = 1;
    	  }else if(token.equalsIgnoreCase("kids")){
    		  storeInfo[10] = 1;
    	  }else if(token.equalsIgnoreCase("drive_through")){
    		  storeInfo[11] = 1;
    	  }
      }
      
      
      System.out.println(Arrays.toString(storeInfo));
      List<StoreInfoDto> info = null;
      info = storeDao.selectStoreByStoreInfo(query);
      int k=info.size();
      
      for(int i=0; i < k;i++){
    	  if(info.get(i).getReservation() == storeInfo[0]){
    		  
    	  }else if(info.get(i).getDelivery() == storeInfo[1]){
    		  
    	  }else if(info.get(i).getTakeOut() == storeInfo[2]){
    		  
    	  }else if(info.get(i).getCreditCard() == storeInfo[3]){
    		  
    	  }else if(info.get(i).getParking() == storeInfo[4]){
    		  
    	  }else if(info.get(i).getGroup1() == storeInfo[5]){
    		  
    	  }else if(info.get(i).getToilet() == storeInfo[6]){
    		  
    	  }else if(info.get(i).getWifi() == storeInfo[7]){
    		  
    	  }else if(info.get(i).getTv() == storeInfo[8]){
    		  
    	  }else if(info.get(i).getSeating() == storeInfo[9]){
    		  
    	  }else if(info.get(i).getKids() == storeInfo[10]){
    		  
    	  }else if(info.get(i).getDriveThrough() == storeInfo[11]){
    		  
    	  }else info.remove(i);
    	  System.out.println(info.get(i));
      }
      
      
      ModelAndView mav = new ModelAndView();
      //mav.addObject("query", query);
      //mav.setViewName("/search/findStore");
            
      return null;
   }
   
      
   @RequestMapping(value = "/proxy", method = RequestMethod.GET)
   public ModelAndView proxy(HttpServletRequest request,
            HttpServletResponse response) throws Exception {      
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/store/api_proxy");
      return mav;
   }
   
   @RequestMapping(value = "/getLocalStore", method = RequestMethod.GET)
   public ModelAndView getLocalStore(HttpServletRequest request,
           HttpServletResponse response) throws Exception {
	   	String address = request.getParameter("address");
	   	List<StoreDto> list = storeDao.selectStoreByAddress(address);
	   	
	   	ModelAndView mav = new ModelAndView();
	   	mav.addObject("storeList", list);
		mav.setViewName("/main/region");
		return mav;	   
   }
}
