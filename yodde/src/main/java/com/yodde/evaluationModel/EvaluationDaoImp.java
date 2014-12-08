package com.yodde.evaluationModel;

import java.util.HashMap;
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
   public int evaluationCheck(String email, int reviewId) {
      HashMap<String, Object> hMap = new HashMap<String, Object>();
      //System.out.println(email + "," + reviewId);
      hMap.put("email", email);
      hMap.put("reviewId", reviewId);
      EvaluationDto eval = new EvaluationDto();
      
      try{
         session=sqlSessionFactory.openSession();
         eval=session.selectOne("evaluationCheck", hMap);
      }catch(Exception e){
         e.printStackTrace();
         System.out.println("evaluationCheck Error");
      }finally{
         session.close();
      }
      //System.out.println("eval!!");
      if (eval == null) {
      //   System.out.println("기존 정보 없음");
         return 0;
      }
      else {
      //   System.out.println(eval.getEval());
         return eval.getEval();
      }
   }

   @Override
      public int insertEval(EvaluationDto eval) {
         int value = 0;
         HashMap<String, Integer> hMap = new HashMap<String, Integer>();
         hMap.put("reviewId", eval.getReviewId());
         
         if(eval.getEval()==1){
            hMap.put("Like", 1);
            hMap.put("Unlike", 0);
         }
         if(eval.getEval()==2){
            hMap.put("Like", 0);
            hMap.put("Unlike", 1);
         }
         
         try{
            session=sqlSessionFactory.openSession();
            value=session.insert("insertEval", eval);
            value=session.insert("insertLikeUnlike", hMap);
            session.commit();
         }catch(Exception e){
            e.printStackTrace();
            System.out.println("insert evaluation Error");
            session.rollback();
         }finally{
            session.close();
         }
         
         return value;
      }

   @Override
   public int deleteEval(EvaluationDto eval) {
      int value = 0;
      HashMap<String, Integer> hMap = new HashMap<String, Integer>();
      hMap.put("reviewId", eval.getReviewId());
         
      if(eval.getEval()==1){
         hMap.put("Like", 1);
         hMap.put("Unlike", 0);
      }
      if(eval.getEval()==2){
         hMap.put("Like", 0);
         hMap.put("Unlike", 1);
      }
         
      try{
         session=sqlSessionFactory.openSession();
         value=session.delete("deleteEval", eval);
         value=session.insert("deleteLikeUnlike", hMap);
         session.commit();
      }catch(Exception e){
    	  session.rollback();
         e.printStackTrace();
         System.out.println("delete evaluation Error");
      }finally{
         session.close();
      }
      
      return value;
   }

   @Override
   public List<EvaluationDto> selectList(String email, int reviewId) {
      List<EvaluationDto> list = null;

      HashMap<String, Object> hMap = new HashMap<String, Object>();
      hMap.put("email", email);
      hMap.put("reviewId", reviewId);
      
      try{
         session = sqlSessionFactory.openSession();
         list = session.selectList("selectEvalList", hMap);
      }catch(Exception e){
         System.out.println("EvaluationDaoImp > selectList Error");
         e.printStackTrace();
      }finally{
         session.close();
      }
      
      return list;
   }
}