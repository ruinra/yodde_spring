package com.yodde.reviewModel;

import java.util.Date;
import java.util.List;

public class Review {
	private int reviewId;
	private int storeId;
	private String profilePic;
	private String writer;
	private String email;
	private int rate;
	private Date writeDate;
	private Date lastModify;
	private int like1;
	private int unlike;
	private int report;
	private String content;
	private int pic1;
	private int pic2;
	private int pic3;
	private int pic4;
	private int pic5;
	private List<String> picPath;
	private String writer_email;
	private int eval; // 0 : no eval 1: like 2: unlike 3: report
	private int totalReview;

	public int getTotalReview() {
		return totalReview;
	}
	public void setTotalReview(int totalReview) {
		this.totalReview = totalReview;
	}
	public int getEval() {
		return eval;
	}
	public void setEval(int eval) {
		this.eval = eval;
	}

	public String getWriter_email() {
		return writer_email;
	}

	public void setWriter_email(String writer_email) {
		this.writer_email = writer_email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public Date getLastModify() {
		return lastModify;
	}

	public void setLastModify(Date lastModify) {
		this.lastModify = lastModify;
	}

	public int getLike1() {
		return like1;
	}

	public void setLike1(int like1) {
		this.like1 = like1;
	}

	public int getUnlike() {
		return unlike;
	}

	public void setUnlike(int unlike) {
		this.unlike = unlike;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPic1() {
		return pic1;
	}

	public void setPic1(int pic1) {
		this.pic1 = pic1;
	}

	public int getPic2() {
		return pic2;
	}

	public void setPic2(int pic2) {
		this.pic2 = pic2;
	}

	public int getPic3() {
		return pic3;
	}

	public void setPic3(int pic3) {
		this.pic3 = pic3;
	}

	public int getPic4() {
		return pic4;
	}

	public void setPic4(int pic4) {
		this.pic4 = pic4;
	}

	public int getPic5() {
		return pic5;
	}

	public void setPic5(int pic5) {
		this.pic5 = pic5;
	}

	public List<String> getPicPath() {
		return picPath;
	}

	public void setPicPath(List<String> picPath) {
		this.picPath = picPath;
	}

	public int getPic(int index) {
		switch (index) {
		case 0:
			return pic1;
		case 1:
			return pic2;
		case 2:
			return pic3;
		case 3:
			return pic4;
		case 4:
			return pic5;
		}

		return 0;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
}
