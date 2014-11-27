package com.yodde.reviewModel;

import java.util.List;

public interface ReviewDao {
	public List<Review> 	getReviewsByStoreId(int storeId);
	public int				insertReview(ReviewDto review);	
}
