package com.yodde.reviewModel;

public class EvaluationDto {
	private int evalId;
	private int reviewId;
	private String evaluator;
	private int eval;
	private String reportDetail;
	
	public int getEvalId() {
		return evalId;
	}
	public void setEvalId(int evalId) {
		this.evalId = evalId;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getEvaluator() {
		return evaluator;
	}
	public void setEvaluator(String evaluator) {
		this.evaluator = evaluator;
	}
	public int getEval() {
		return eval;
	}
	public void setEval(int eval) {
		this.eval = eval;
	}
	public String getReportDetail() {
		return reportDetail;
	}
	public void setReportDetail(String reportDetail) {
		this.reportDetail = reportDetail;
	}
}
