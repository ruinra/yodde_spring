package com.yodde.relationAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.relationModel.RelationDao;
import com.yodde.storeModel.StoreDto;

@Component
@Controller
public class StoreRelationCtrl {
	@Autowired
	private RelationDao	relationDao;
	
	@RequestMapping(value = "/info/storeFollowingList", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView storeFollowingList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String email=request.getParameter("email");
		//System.out.println(email);
		
		List<StoreDto> list;
		list = relationDao.selectFollowingStore(email);
		
		//System.out.println(list);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("storeFollowingList", list);
		mav.addObject("email", email);
		mav.setViewName("/relation/storeFollowingList");
		
		return mav;
	}
	
	@RequestMapping(value = "/info/storeFollowerList", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView storeFollowerList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/relation/followerList");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/followStoreCheck", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView followCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 로그인 email, storeId를 받아온다
		String email=request.getParameter("email");
		String store=request.getParameter("storeId");
		//System.out.println(email + "," + store);
		
		int check=relationDao.checkFollowStore(store, email);
		//System.out.println(check);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
	
	@RequestMapping(value = "/followStore", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
	public ModelAndView follow(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 로그인 email, storeId를 받아온다
		String email=request.getParameter("email");
		String store=request.getParameter("storeId");
		//System.out.println(email + "," + store);
		
		int check = relationDao.checkFollowStore(store, email);
		//System.out.println(check);
		
		if(check == 1){
			check = relationDao.unfollowStore(store, email);
		}else if(check == 0){
			check = relationDao.followStore(store, email);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
	
	/*member 입장에서 storefollowing 리스트에서 호출*/
	@RequestMapping(value = "/info/followStoreCheckMyPage", method=RequestMethod.GET)
	public ModelAndView followCheckMyPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 로그인 email, storeId를 받아온다
		String email=request.getParameter("email");
		String store=request.getParameter("storeId");
		//System.out.println(email + "," + store);
		
		int check=relationDao.checkFollowStore(store, email);
		//System.out.println(check);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
	
	/*member 입장에서 storefollowing 리스트에서 호출*/
	@RequestMapping(value = "/info/followStoreMyPage", method=RequestMethod.GET)
	public ModelAndView followMyPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 로그인 email, storeId를 받아온다
		String email=request.getParameter("email");
		String store=request.getParameter("storeId");
		//System.out.println("followMyPage : " + email + "," + store);
		
		int check = relationDao.checkFollowStore(store, email);
		System.out.println(check);
		
		if(check == 1){
			check = relationDao.unfollowStore(store, email);
		}else if(check == 0){
			check = relationDao.followStore(store, email);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",check);
		mav.setViewName("/result");
		
		return mav;
	}
}
