package com.yodde.evaluationModel;

import java.util.HashMap;

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
	public int evaluationCheck(String email, int reviewId) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("reviewId", reviewId);
		int value = 0;
		EvaluationDto eval = null;
		
		try{
			session=sqlSessionFactory.openSession();
			eval=session.selectOne("checkEvaluation", hm);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("email:" + email + ", reivewId:" + reviewId + "check evaluation Error");
		}finally{
			session.close();
		}
		
		if (eval == null) return 0;
		else return eval.getEval();
	}

	@Override
	public int insertEval(EvaluationDto eval) {
		int value = 0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("insertEval", eval);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("insert evaluation Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int deleteEval(EvaluationDto eval) {
		int value = 0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.delete("deleteEval", eval);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("delete evaluation Error");
		}finally{
			session.close();
		}
		
		return value;
	}
}
