package com.yodde.evaluationModel;

public interface EvaluationDao {
	int evaluationCheck(String email, int reviewId);
	int insertEval(EvaluationDto eval);
	int deleteEval(EvaluationDto eval);
}
