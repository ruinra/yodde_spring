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

@Component
@Controller
public class SearchMemberCtrl {
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private MemberDao memberDao;
	
	@RequestMapping(value = "/searchMember", method=RequestMethod.GET)
	public ModelAndView join(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String query=request.getParameter("query");
		System.out.println(query);		
		
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
}
