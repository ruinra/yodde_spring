package com.yodde.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.yodde.memberModel.MemberDao;

@Service
public class UserService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	@Autowired //해당 변수타입과 일치하는 빈을 찾아서 주입
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
		
		logger.info("username :" + username);
		//encoder
		//private ShaPasswordEncoder encoder;
		//dao
		boolean isExistMember = memberDao.isExistMember(username);
		/*
		if (isExistMember) 
			System.out.println(username + ":ok!");
		else
			System.out.println(username + ":aaaa");
		System.out.println("AAA");
		*/
		String password = "aabcb987e4b425751e210413562e78f776de6285";
		
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		Role role = new Role();
		role.setName("ROLE_USER");
		
		List<Role> roles = new ArrayList<Role>();
		roles.add(role);
		user.setAuthorities(roles);
		
		//not found
		//if (user == null) throw new UsernameNotFoundException("not found user");
		
		return user;
	}
	
	
}
