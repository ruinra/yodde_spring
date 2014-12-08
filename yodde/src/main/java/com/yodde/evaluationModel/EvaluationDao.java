package com.yodde.evaluationModel;

import java.util.List;

public interface EvaluationDao {
   public int evaluationCheck(String email, int reviewId);
   public int insertEval(EvaluationDto eval);
   public int deleteEval(EvaluationDto eval); 
   public List<EvaluationDto> selectList(String email, int reviewId); 
}