package com.yodde.relationAction;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yodde.memberModel.MemberDto;
import com.yodde.relationModel.RelationDao;
import com.yodde.relationModel.RelationDto;

@Component
@Controller
public class MemberRelationCtrl {
   @Autowired
   private RelationDao   relationDao;
   
   @RequestMapping(value = "/info/followerList", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
   public ModelAndView followerList(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      String email = request.getParameter("email");
      //System.out.println(email);
      
      List<RelationDto> list;
      list=relationDao.selectFollowerMember(email);
      
      int count =0;
      int total = list.size();
      int[] index = new int[total];
      String follower = "";
      String followee = "";
      for(int i=0; i <list.size();i++){
         for(int j=0; j<list.size();j++){
            follower = list.get(i).getFollower();
            followee = list.get(j).getFollowee();
            //System.out.println("i의 getFollower= " + list.get(i).getFollower() +"\t j의 getFollowee= "+list.get(j).getFollowee());
            if(follower.equalsIgnoreCase(followee)) {
               //System.out.println("if문 안에서 i값 = " +i +"\nif문 안에서 j값 =" + j);
               index[i]=j;
               break;
            }
         }
      }
      //System.out.println(Arrays.toString(index));
      int k=0;
      int sub = 0;
      while(index[k]>0){
         //System.out.println("k = " + k);
         if(k>0){
            list.remove((index[k]-sub));
            sub++;
         }else{
            list.remove(index[k]);
            sub++;
         }
         k++;
      }
      
      //System.out.println("sizeList = " + list.size());
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("count", count);
      mav.addObject("total", total);
      mav.addObject("followerList", list);
      mav.addObject("email", email);
      mav.setViewName("/relation/followerList");
      
      return mav;
   }
   
   @RequestMapping(value = "/info/followingList", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
   public ModelAndView followingList(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      String email=request.getParameter("email");
      
      List<MemberDto> list;
      list=relationDao.selectFollowingMember(email);
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("selectFollowingMember", list);
      mav.addObject("email", email);
      mav.setViewName("/relation/followingList");
      
      return mav;
   }
   
   /* follower list에서 팔로잉 버튼 부분 */
   @RequestMapping(value = "/info/followerMemberCheckMyPage", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
   public ModelAndView checkFollowerMemberMyPage(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      // 로그인 follower, following를 받아온다
      String email=request.getParameter("email");
      String following = request.getParameter("following");
      //System.out.println("checkFollowerMemberMyPage : " +email+","+following);
      
      int check=relationDao.checkFollowMember(email, following);
      //System.out.println(check);
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("result",check);
      mav.setViewName("/result");
      
      return mav;
   }
   
   /* follower list에서 팔로잉 버튼 부분 */
   @RequestMapping(value = "/info/followerMemberMyPage", method=RequestMethod.GET)
   public ModelAndView followerMypage(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      String email=request.getParameter("following");
      String following = request.getParameter("email");
      //System.out.println(email + "+" + following);      //상대방 + 나
      
      int check = relationDao.checkFollowMember(email, following);
      System.out.println(check);

      if(check == 1){
         check = relationDao.unfollowMember(email, following);
      }else if(check == 0){
         check = relationDao.followMember(email, following);
      }
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("result",check);
      mav.setViewName("/result");
      
      return mav;
   }
   
   /* following list에서 팔로잉 버튼 부분 */
   @RequestMapping(value = "/info/followMemberCheckMyPage", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
   public ModelAndView checkFollowMemberMyPage(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      // 로그인 follower, following를 받아온다
      String email=request.getParameter("email");
      String following = request.getParameter("following");
      //System.out.println("checkFollowMemberMyPage : 나" + email+", 상대"+following);
      System.out.println("followMemberCheckMyPage에서 checkFollowMember호출 하기 전");
      int check=relationDao.checkFollowMember(email, following);
      System.out.println("MemberRelationCtrl "+check);
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("result", check);
      mav.setViewName("/result");
      
      return mav;
   }
   
   /* following list에서 팔로잉 버튼 부분 */
   @RequestMapping(value = "/info/followMemberMyPage", method=RequestMethod.GET)
   public ModelAndView followMypage(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      String email=request.getParameter("email");
      String following = request.getParameter("following");
      //System.out.println("followMypage : 나" + email + ", 상대" + following);
      
      int check = relationDao.checkFollowMember(email, following);
      //System.out.println("팔로우나 팔로잉 클릭을 했을때 = "+check);

      if(check == 1){
         check = relationDao.unfollowMember(email, following);
      }else if(check == 0){
         check = relationDao.followMember(email, following);
      }
      
      //System.out.println("if문 다 돌고나서의 체크 값=" +check);
      ModelAndView mav=new ModelAndView();
      mav.addObject("result",check);
      mav.setViewName("/result");
      
      return mav;
   }
   
   @RequestMapping(value = "/info/history", method=RequestMethod.GET) //storeinfo.jsp에서 들어올때
   public ModelAndView history(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      
      ModelAndView mav=new ModelAndView();
      mav.setViewName("/relation/historyMap");
      
      return mav;
   }
   
   /* store_info에서 팔로잉 버튼 부분 */
   @RequestMapping(value = "/member/followMemberCheck", method=RequestMethod.GET)
   public ModelAndView checkFollowMember(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      // 로그인 follower, following를 받아온다
      String follower=request.getParameter("follower");
      String following=request.getParameter("following");

      int check=relationDao.checkFollowMember(follower, following);
      //System.out.println(check);
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("result",check);
      mav.setViewName("/result");
      
      return mav;
   }
   
   /* store_info에서 팔로잉 버튼 부분 */
   @RequestMapping(value = "/member/followMember", method=RequestMethod.GET)
   public ModelAndView follow(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      String follower = request.getParameter("follower");
      String following = request.getParameter("following");
      //System.out.println(follower+","+following);

      int check = relationDao.checkFollowMember(follower, following);
      //System.out.println(check);

      if(check == 1){
         check = relationDao.unfollowMember(follower, following);
      }else if(check == 0){
         check = relationDao.followMember(follower, following);
      }
      //System.out.println(check+"12341234");
      
      ModelAndView mav=new ModelAndView();
      mav.addObject("result",check);
      mav.setViewName("/result");
      
      return mav;
   }
}