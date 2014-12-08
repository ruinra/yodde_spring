package com.yodde.memberModel;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDaoImp implements MemberDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	private MemberDto member;

	@Override
	public int memberJoin(MemberDto memberDto) {
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("memberJoin", memberDto);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Member Join Error");
		}finally{
			session.close();
		}
		
		return value;
	}
	
	@Override
	public int memberJoinAuth(MemberDto memberDto) {
		int value = 0;
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("email", memberDto.getEmail());
		hm.put("authority", "ROLE_USER");
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("memberJoinAuth", hm);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("MemberAuth Join Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public boolean isExistMember(String id) {
		boolean isExist = false;
		
		try{
			session=sqlSessionFactory.openSession();
			String result =session.selectOne("isExistMember", id);
			if (result != null) isExist = true;
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("isExistMember Error");
		}finally{
			session.close();
		}
		
		return isExist;
	}

	@Override
	public MemberDto selectMember(String id) {		
		try{
			session=sqlSessionFactory.openSession();
			member =session.selectOne("selectMember", id);
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("selectMember Error");
		}finally{
			session.close();
		}
		
		return member;
	}

	@Override
	public List<MemberDto> selectMembersByNick(String query) {
		List<MemberDto> list=null;
		  
		try{
			session=sqlSessionFactory.openSession();
			list=session.selectList("selectMembersByNick", "%"+query+"%");
		}catch(Exception e){
			System.out.println("selectlist member by nick Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

	@Override
	public int updateMemberFile(MemberDto memberDto) {
		int value = 0;
		  
		try{
			session=sqlSessionFactory.openSession();
			value =session.update("updateMemberFile", memberDto);
			session.commit();
		}catch(Exception e){
			System.out.println("MemberFile Update Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int updateMember(MemberDto memberDto) {
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value =session.update("updateMember", memberDto);
			session.commit();
		}catch(Exception e){
			System.out.println("Member Update Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		return value;
	}

	@Override
	public int idCheck(String email) {
		// TODO Auto-generated method stub
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			System.out.println(email);
			String check=session.selectOne("memberIdCheck", email);
			if(check!=null) value=1;
		}catch(Exception e){
			System.out.println("Member IdCheck Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int nickName(String name) {
		// TODO Auto-generated method stub
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			System.out.println(name);
			String check=session.selectOne("memberNickNameCheck", name);
			if(check!=null) value=1;
		}catch(Exception e){
			System.out.println("Member NickNameCheck Error");
		}finally{
			session.close();
		}
		return value;
	}
	
	@Override
	   public int memberDelete(MemberDto memberDto) {
	      int value = 0;
	      
	      try {
	         session = sqlSessionFactory.openSession();
	         value = session.delete("deleteMember", memberDto);
	         if (value > 0){
	            session.delete("deleteReviewByMemberDelete", memberDto.getEmail());
	            session.delete("deleteAuthByMemberDelete", memberDto.getEmail());
	         }
	         session.commit();
	      }catch(Exception e) {
	         System.out.println("deleteMember Error");
	         e.printStackTrace();
	      }finally{
	         session.close();
	      }
	      
	      return value;
	   }


}
