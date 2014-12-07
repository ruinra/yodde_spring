package com.yodde.storeModel;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StoreDaoImp implements StoreDao {
   @Autowired
   private SqlSessionFactory sqlSessionFactory;
   private SqlSession session;

   @Override
   public int insertStore(StoreDto store) {
      int value = 0;

      try {
         session = sqlSessionFactory.openSession();
         value = session.insert("insertStore", store);
         session.commit();
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("Store Insert Error.");
      } finally {
         session.close();
      }

      return value;
   }

   @Override
   public int isExistStore(StoreDto store) {
      String id = null;
      
      try {
         session = sqlSessionFactory.openSession();
         id = session.selectOne("isExistStore", store);
         
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("isExistStore Error.");
      } finally {
         session.close();
      }
      
      if (id == null) return 0;
      
      return Integer.parseInt(id);
   }

   @Override
   public StoreDto selectStoreByStoreId(int storeId) {
      StoreDto store = null;
      try {
         session = sqlSessionFactory.openSession();
         store = session.selectOne("selectStoreByStoreId", storeId);
         
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("selectStoreByStoreId Error.");
      } finally {
         session.close();
      }
      
      return store;
   }

   @Override
   public int insertStoreInfo(int storeId) {
      int value=0;
      
      try {
         session = sqlSessionFactory.openSession();
         value = session.insert("storeInfo", storeId);
         session.commit();
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("Insert Store Error.");
      } finally {
         session.close();
      }
      
      return value;
   }

   @Override
   public int updateStoreFile(StoreDto storeDto) {
      int value=0;
      
      try {
         session = sqlSessionFactory.openSession();
         value = session.update("storeUpdateFile", storeDto);
         session.commit();
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("StoreFile Update Error.");
      } finally {
         session.close();
      }
      
      return value;
   }
   
   @Override
   public StoreInfoDto selectStoreInfo(int storeId) {
      StoreInfoDto storeInfo=null;
      
      try{
         session=sqlSessionFactory.openSession();
         storeInfo=session.selectOne("storeInfoSelect", storeId);
      }catch(Exception e){
         e.printStackTrace();
         System.out.println("StoreInfo Select Error");
      }finally{
         session.close();
      }
      return storeInfo;
   }

   @Override
   public int updateStoreInfo(StoreInfoDto storeInfo) {
      int value=0;
      
      try{
         session=sqlSessionFactory.openSession();
         value=session.update("storeInfoUpdate", storeInfo);
      }catch(Exception e){
         e.printStackTrace();
         System.out.println("StoreInfo Select Error");
      }finally{
         session.close();
      }
      return value;
   }

   @Override
   public int updateStore(StoreDto storeDto) {
      int value=0;
      
      try {
         session = sqlSessionFactory.openSession();
         value = session.update("storeUpdate", storeDto);
         session.commit();
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("Store Update Error.");
      } finally {
         session.close();
      }
      return value;
   }
   
      @Override
       public List<StoreDto> selectRecentReviewName(String email) {
         List<StoreDto> list=null;
         try{
            session=sqlSessionFactory.openSession();
            list=session.selectList("selectRecentReviewName", email);
            //System.out.println("list="+list);
         }catch(Exception e){
            System.out.println("selectRecentReviewName Error");
            e.printStackTrace();
         }finally{
            session.close();
         }
         
         return list;
      }

	@Override
	public List<StoreDto> selectStoreByCategory(String category) {
		List<StoreDto> list = null;
		//System.out.println("StoreDaoImp "+category);
		
		try{
			session = sqlSessionFactory.openSession();
			list=session.selectList("selectStoreByCategory", '%'+category+'%');
			//System.out.println(list.get(0).getStoreName());
		}catch(Exception e){
			System.out.println("StoreDaoImp > selectStoreByCategory error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

	@Override
	public List<StoreInfoDto> selectStoreByStoreInfo(String query) {
		List<StoreInfoDto> list= null;
		
		try{
			session= sqlSessionFactory.openSession();
			list = session.selectList("selectStoreByStoreName", '%'+query+'%');
			
		}catch(Exception e){
			System.out.println("StoreDaoImp > selectStoreByStoreInfo Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

	@Override
	public List<StoreDto> selectStoreByAddress(String query) {
		List<StoreDto> list= null;
		
		try{
			session= sqlSessionFactory.openSession();
			list = session.selectList("selectStoreByAddress", '%'+query+'%');
			
		}catch(Exception e){
			System.out.println("selectStoreByAddress");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

}