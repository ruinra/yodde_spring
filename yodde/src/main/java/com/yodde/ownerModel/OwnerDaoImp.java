package com.yodde.ownerModel;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yodde.storeModel.StoreDto;
import com.yodde.storeModel.StoreInfoDto;

@Component
public class OwnerDaoImp implements OwnerDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	private OwnerDto owner;

	@Override
	public int ownerJoin(OwnerDto ownerDto) {
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("storeJoin", ownerDto);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Store OwnerJoin Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int ownerJoinAuth(OwnerDto ownerDto) {
		int value = 0;
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("email", ownerDto.getEmail());
		hm.put("authority", "ROLE_USER");
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("ownerJoinAuth", hm);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("OwnerAuth Join Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public OwnerDto selectOwner(String id) {
		
		try{
			session=sqlSessionFactory.openSession();
			owner =session.selectOne("selectOwner", id);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("selectOwner Error");
		}finally{
			session.close();
		}
		
		return owner;
	}

	@Override
	public int updateOwnerFile(OwnerDto ownerDto) {
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.update("ownerUpdateFile", ownerDto);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("OwnerUpdate Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int updateOwner(OwnerDto ownerDto) {
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.update("ownerUpdate", ownerDto);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("OwnerUpdate Error");
		}finally{
			session.close();
		}
		return value;
	}
	
	@Override
	   public int  deleteOwner(OwnerDto ownerDto) {
	      int value=0;
	      
	      try{
	         session=sqlSessionFactory.openSession();
	         value=session.delete("deleteOwner",ownerDto);
	         if(value > 0){
//	            session.delete("deleteReviewByOwnerDelete" , ownerDto.getEmail());
	            session.delete("deleteAuthByOwnerDelete" , ownerDto.getEmail());
	         }
	         session.commit();
	      }catch(Exception e){
	         System.out.println("deleteOwner Error");
	         e.printStackTrace();
	      }finally{
	         session.close();
	      }
	      return value;
	   }
}
