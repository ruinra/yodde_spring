package com.yodde.relationModel;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
}
