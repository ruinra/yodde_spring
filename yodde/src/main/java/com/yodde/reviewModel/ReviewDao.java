package com.yodde.reviewModel;

import java.util.List;

public interface ReviewDao {
	public List<Review> 	getReviewsByStoreId(int storeId);
	public int				insertReview(ReviewDto review);	
	public int 				getReviewCnt(String email);
	public List<ReviewDto>   selectRecentReviewRate(String email);
	public double averageRate(String email);
	public List<Review> getReviewByWriter(String email);
	public int             deleteReveiw(int reviewId);
}
