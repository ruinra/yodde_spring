package com.yodde.reviewModel;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReviewDaoImp implements ReviewDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
		
	@Override
	public List<Review> getReviewsByStoreId(int storeId) {		
		List<Review> list=null;
	  
		try{
			session=sqlSessionFactory.openSession();
			list=session.selectList("selectReviewByStoreId", storeId);
			if (list != null) {
				for (Review review:list){
					List<String>files = new ArrayList<String>();
					for (int i = 0; i < 5; i++) {
						System.out.println(review.getPic(i));
						String path = session.selectOne("getFilePath", review.getPic(i));
						files.add(i, path);
						//System.out.println(path);
					}
					review.setPicPath(files);
				}
			}
		}catch(Exception e){
			System.out.println("selectlist review by storeid Error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return list;
	}

	@Override
	public int insertReview(ReviewDto review) {
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("writeReview", review);
			session.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("writeReview Error");
		}finally{
			session.close();
		}
		
		return value;
	}	
}
