package com.yodde.evaluationModel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component	
public class EvaluationDaoImp implements EvaluationDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	
	@Override
	public EvaluationDto evaluationCheck(String email, int reviewId) {
		List<EvaluationDto> list = null;
		EvaluationDto eval = new EvaluationDto();
		eval.setEvaluator(email);
		eval.setReviewId(reviewId);
		
		try{
			session=sqlSessionFactory.openSession();
			list=session.selectList("checkEvaluation");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("email:" + email + ", reivewId:" + reviewId + "check evaluation Error");
		}finally{
			session.close();
		}
		
		if (list.size() == 0) {
			System.out.println("list empty");
			return null;
		}
		System.out.println("list "+ list.size());
		return list.get(0);
	}
}
