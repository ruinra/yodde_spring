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

import com.yodde.memberModel.MemberDao;
import com.yodde.memberModel.MemberDto;
import com.yodde.relationModel.RelationDao;
import com.yodde.reviewModel.ReviewDao;
import com.yodde.reviewModel.ReviewDto;
import com.yodde.storeModel.StoreDao;
import com.yodde.storeModel.StoreDto;

@Component
@Controller
public class SearchMemberCtrl {
   @Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
   private MemberDao memberDao;
   @Autowired
   private ReviewDao reviewDao;
   @Autowired
   private RelationDao relationDao;
   @Autowired
   private StoreDao storeDao;
   
   @RequestMapping(value = "/searchMember", method=RequestMethod.GET)
   public ModelAndView searchMember(HttpServletRequest request,
         HttpServletResponse response) throws Exception {

      String query=request.getParameter("query");
      //System.out.println(query);      
      
      //result search member
      List<MemberDto> list;
      list = memberDao.selectMembersByNick(query);
      
      //System.out.println(list);
      
      ModelAndView mav = new ModelAndView();      
      
      mav.addObject("memberList", list);
      mav.addObject("query", query);
      mav.setViewName("/search/findMember");
      return mav;
   }
   
   @RequestMapping(value = "/member/memberMyPage", method=RequestMethod.GET)
   public ModelAndView getMemberInfo(HttpServletRequest request,
      HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
        
      String email = request.getParameter("email");
      //System.out.println(email);
      MemberDto member = memberDao.selectMember(email);
      int reviewCnt = reviewDao.getReviewCnt(email);
      int followingCnt = relationDao.getFollowingCnt(email);
        int followerCnt = relationDao.getFollowerCnt(email);
        int followingStoreCnt = relationDao.getfollowingStoreCnt(email);
        List<ReviewDto> rateList;
        rateList=reviewDao.selectRecentReviewRate(email);
        List<StoreDto> nameList;
        nameList=storeDao.selectRecentReviewName(email);
        
      if (member != null) {
         mav.addObject("member", member);
         mav.addObject("reviewCnt", reviewCnt);
         mav.addObject("followingCnt", followingCnt);
           mav.addObject("followerCnt", followerCnt);
          mav.addObject("followingStoreCnt", followingStoreCnt);
            
          mav.addObject("selectRecentReviewRate", rateList);
          mav.addObject("selectRecentReviewName", nameList);
      }            
        
      mav.setViewName("/member/memberMyPage");
      return mav;
   }
   
   @RequestMapping(value = "/profilePic", method=RequestMethod.GET)
   public ModelAndView join(HttpServletRequest request,
         HttpServletResponse response) throws Exception {

      String email=request.getParameter("email");
      //System.out.println(email);      
      
      //result search member profilePic
      String profilePic = null;
      MemberDto member = memberDao.selectMember(email);
      profilePic = member.getProfilePic();
      
      //System.out.println(profilePic);
      
      ModelAndView mav = new ModelAndView();      
      
      mav.addObject("result", profilePic);
      mav.setViewName("/result");
      
      return mav;
   }
   
   
}