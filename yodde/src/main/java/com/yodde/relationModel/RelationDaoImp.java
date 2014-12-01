package com.yodde.relationModel;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yodde.memberModel.MemberDto;
import com.yodde.storeModel.StoreDto;

@Component
public class RelationDaoImp implements RelationDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;	

	@Override
	public int checkFollowStore(String store, String email) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("store", store);
		hMap.put("email", email);
		
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			String followCheck=session.selectOne("followCheck", hMap);
			if(followCheck != null) value=1;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Store Follow Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int unfollowStore(String store, String email) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("store", store);
		hMap.put("email", email);
		
		int value=0;
				
			try{
				session=sqlSessionFactory.openSession();
				value=session.delete("deleteFollow", hMap);
				session.commit();
				if(value == 1) value=0;
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("Store Follow Error");
			}finally{
				session.close();
			}
				
		return value;
	}

	@Override
	public int followStore(String store, String email) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("store", store);
		hMap.put("email", email);
		
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("insertFollow", hMap);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Store Follow Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int checkFollowMember(String follower, String following) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("follower", follower);
		hMap.put("following", following);
		
		int value=0;
		//System.out.println(follower + following);
		try{
			session=sqlSessionFactory.openSession();
			String followCheck=session.selectOne("checkFollowMember", hMap);
			System.out.println(followCheck);
			
			if(followCheck != null) value=1;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("checkFollowMember Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int unfollowMember(String follower, String following) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("follower", follower);
		hMap.put("following", following);
		
		int value=0;
				
			try{
				session=sqlSessionFactory.openSession();
				value=session.delete("deleteFollowMember", hMap);
				session.commit();
				if(value == 1) value=0;
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("Member unfollow Error");
			}finally{
				session.close();
			}
				
		return value;
	}

	@Override
	public int followMember(String follower, String following) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("follower", follower);
		hMap.put("following", following);
		
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("insertFollowMember", hMap);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Member Follow Error");
		}finally{
			session.close();
		}
		
		return value;
	}
	
	@Override
	public List<StoreDto> selectFollowingStore(String email) {
		List<StoreDto> list=null;
		
		try{
			session=sqlSessionFactory.openSession();
			list=session.selectList("selectFollowingStore", email);
		}catch(Exception e){
			System.out.println("selectFollowingStore Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

	@Override
	public List<MemberDto> selectFollowingMember(String email) {
		List<MemberDto> list=null;
		
		try{
			session=sqlSessionFactory.openSession();
			list=session.selectList("selectFollowingMember", email);
		}catch(Exception e){
			System.out.println("selectFollowingMember Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

	@Override
	public List<MemberDto> selectFollowerMember(String email) {
		List<MemberDto> list=null;
		
		try{
			session=sqlSessionFactory.openSession();
			list=session.selectList("selectFollowerMember", email);
		}catch(Exception e){
			System.out.println("selectFollowerMember Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

	@Override
	public int getFollowingCnt(String email) {
		int cnt = 0;
		
		try{
			session=sqlSessionFactory.openSession();
			cnt=session.selectOne("getFollowingCnt", email);
		}catch(Exception e){
			System.out.println("getFollowingCnt Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int getFollowerCnt(String email) {
		int cnt = 0;
		
		try{
			session=sqlSessionFactory.openSession();
			cnt=session.selectOne("getFollowerCnt", email);
		}catch(Exception e){
			System.out.println("getFollowerCnt Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int getfollowingStoreCnt(String email) {
		int cnt = 0;
		
		try{
			session=sqlSessionFactory.openSession();
			cnt=session.selectOne("getfollowingStoreCnt", email);
		}catch(Exception e){
			System.out.println("getfollowingStoreCnt Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return cnt;
	}
}
