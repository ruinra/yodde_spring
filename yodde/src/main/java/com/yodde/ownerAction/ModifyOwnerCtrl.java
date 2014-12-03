package com.yodde.ownerAction;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.ownerModel.OwnerDao;
import com.yodde.ownerModel.OwnerDto;
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;
import com.yodde.storeModel.StoreInfoDto;

@Component
@Controller
public class ModifyOwnerCtrl {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private OwnerDao ownerDao;
	@Autowired
	private StoreDao storeDao;
	
	@RequestMapping(value = "/info/ownerMyPage", method=RequestMethod.GET)
	public ModelAndView ownerMyPage(@ModelAttribute OwnerDto ownerDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String email=request.getParameter("email");
		//System.out.println(email);
		
		ownerDto=ownerDao.selectOwner(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ownerDto", ownerDto);
		mav.setViewName("/owner/ownerMyPage");
		return mav;
	}

	@RequestMapping(value = "/info/modifyOwner", method=RequestMethod.GET)
	public ModelAndView modifyOwner(@ModelAttribute OwnerDto ownerDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String email=request.getParameter("email");
		//System.out.println(email);
		
		ownerDto=ownerDao.selectOwner(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ownerDto", ownerDto);
		mav.setViewName("/owner/modifyStoreOwner");
		return mav;
	}
	
	@RequestMapping(value = "/info/modifyOwner", method=RequestMethod.POST)
	public ModelAndView modifyOwnerOk(@ModelAttribute OwnerDto ownerDto, 
			MultipartHttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String password=request.getParameter("password");
		//String file=request.getParameter("file");
		//System.out.println(password + "," + file);
		
		
		String filename = null;
		String profilePath = "C:/Users/박준태/git/yodde_spring/yodde/src/main/webapp";
		MultipartFile uploadfile = ownerDto.getUploadfile();
		
		//file upload
		if (uploadfile.getOriginalFilename().length() > 0) {
			//System.out.println("file not null" + uploadfile.getOriginalFilename());
			String ext = uploadfile.getOriginalFilename();
			ext = ext.substring(ext.length() - 4);
			//System.out.println(ext);
			//filename = "c:/upload/" + memberDto.getEmail() + ext;
			//C:/Users/Lake/git/yodde_spring/yodde/src/main/java/com/yodde/memberAction
			//System.out.println(session.getServletContext().getRealPath("/upload/"));
			
			filename = "/resources/images/profile/" + ownerDto.getEmail() + ext;
			File file = new File(profilePath + filename);
			
			uploadfile.transferTo(file);
			
			ownerDto.setPassword(password);
			ownerDto.setProfilePic(filename);
			
			int check=ownerDao.updateOwnerFile(ownerDto);
			//System.out.println(check);
			
		} else {
			//System.out.println("file null");
			ownerDto.setPassword(password);
			int check=ownerDao.updateOwner(ownerDto);
			//System.out.println(check);
		}
		
		ownerDto=ownerDao.selectOwner(ownerDto.getEmail());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ownerDto", ownerDto);
		mav.setViewName("/owner/ownerMyPage");
		return mav;
	}
	
	@RequestMapping(value = "/info/modifyStore", method=RequestMethod.GET)
	public ModelAndView modifyStore(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String email=request.getParameter("email");
		//System.out.println(email);
		
		OwnerDto ownerDto=new OwnerDto();
		StoreInfoDto storeInfo=new StoreInfoDto();
		StoreDto storeDto=new StoreDto();
		
		ownerDto=ownerDao.selectOwner(email);
		int storeId=ownerDto.getStoreId();
		//System.out.println(ownerDto.getStoreId());
		
		storeDto=storeDao.selectStoreByStoreId(storeId);
		storeInfo=storeDao.selectStoreInfo(storeId);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("storeDto", storeDto);
		mav.addObject("storeInfo", storeInfo);
		mav.addObject("email", email);
		mav.setViewName("/owner/modifyStore");
		return mav;
	}
	
	@RequestMapping(value = "/info/modifyStore", method=RequestMethod.POST)
	public ModelAndView modifyStoreOk(MultipartHttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		StoreDto storeDto=new StoreDto();
		StoreInfoDto storeInfo=new StoreInfoDto();
		OwnerDto ownerDto=new OwnerDto();
		int storeId=Integer.parseInt(request.getParameter("storeId"));
		String email=request.getParameter("email");
		
		// store 정보 update
		//System.out.println(request.getParameter("storeId"));
		
		storeDto.setStoreId(storeId);
		storeDto.setServiceTime(request.getParameter("time"));
		
		//오픈일 변환
		String date=request.getParameter("day");
		//System.out.println(date);
		
		DateFormat transDay=new SimpleDateFormat("yyyy-MM-dd"); 
		Date openDay=transDay.parse(date);
		
		storeDto.setOpenDate(openDay);	// 오픈일 jsp 설정 다시 할것
		storeDto.setHomepage(request.getParameter("page"));
		String conditions=request.getParameter("conditions");
		if(conditions.equals("open")){
			storeDto.setStatus(1);
		}else{
			storeDto.setStatus(0);
		}
		
		//store 이미지 업로드
		String filename = null;
		String profilePath = "C:/Users/박준태/git/yodde_spring/yodde/src/main/webapp";
		MultipartFile uploadfile = request.getFile("file");
		//System.out.println(uploadfile.getOriginalFilename());
		
		//file upload
		if (uploadfile.getOriginalFilename().length() > 0) {
			//System.out.println("file not null" + uploadfile.getOriginalFilename());
			String ext = uploadfile.getOriginalFilename();
			ext = ext.substring(ext.length() - 4);
			//System.out.println(ext);
			//filename = "c:/upload/" + memberDto.getEmail() + ext;
			//C:/Users/Lake/git/yodde_spring/yodde/src/main/java/com/yodde/memberAction
			//System.out.println(session.getServletContext().getRealPath("/upload/"));
			
			filename = "/resources/images/profile/" + storeDto.getStoreId() + ext;
			File file = new File(profilePath + filename);
			
			uploadfile.transferTo(file);
			
			storeDto.setProfilePic(filename);
			storeDao.updateStoreFile(storeDto);
		} else {
			int check=storeDao.updateStore(storeDto);
			//System.out.println(check);
		}
		
		
		
		// storeInfo 업데이트
		storeInfo.setStoreId(storeId);
		String info=request.getParameter("infomation");
		//System.out.println(info);
		
		if(info.contains("카드 결제")){
			storeInfo.setCreditCard(1);
		}else{
			storeInfo.setCreditCard(0);
		}
		if(info.contains("배달")){
			storeInfo.setDelivery(1);
		}else{
			storeInfo.setDelivery(0);
		}
		if(info.contains("Drive through")){
			storeInfo.setDriveThrough(1);
		}else{
			storeInfo.setDriveThrough(0);
		}
		if(info.contains("단체 예약")){
			storeInfo.setGroup1(1);
		}else{
			storeInfo.setGroup1(0);
		}
		if(info.contains("어린이")){
			storeInfo.setKids(1);
		}else{
			storeInfo.setKids(0);
		}
		if(info.contains("주차")){
			storeInfo.setParking(1);
		}else{
			storeInfo.setParking(0);
		}
		if(info.contains("예약")){
			storeInfo.setReservation(1);
		}else{
			storeInfo.setReservation(0);
		}
		if(info.contains("좌식")){
			storeInfo.setSeating(1);
		}else{
			storeInfo.setSeating(0);
		}
		if(info.contains("포장")){
			storeInfo.setTakeOut(1);
		}else{
			storeInfo.setTakeOut(0);
		}
		if(info.contains("화장실")){
			storeInfo.setToilet(1);
		}else{
			storeInfo.setToilet(0);
		}
		if(info.contains("TV")){
			storeInfo.setTv(1);
		}else{
			storeInfo.setTv(0);
		}
		if(info.contains("WI-FI")){
			storeInfo.setWifi(1);
		}else{
			storeInfo.setWifi(0);
		}
		
		int check=storeDao.updateStoreInfo(storeInfo);
		//System.out.println(check);
		
		ownerDto=ownerDao.selectOwner(email);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ownerDto", ownerDto);
		mav.addObject("storeDto", storeDto);
		mav.setViewName("/owner/ownerMyPage");
		
		return mav;
	}
	
}
