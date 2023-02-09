
package com.fin.kimo.model.dto;

import java.util.Date;

public class ReviewDto {
	private int review_no;
	private String review_title;
	private Date review_date;
	private String review_path;
	private int review_readcount;
	private String member_id;
	private String review_content;
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDto(int review_no, String review_title, Date review_date, String review_path, int review_readcount, String member_id, String review_content) {
		super();
		this.review_no = review_no;
		this.review_title = review_title;
		this.review_date = review_date;
		this.review_path = review_path;
		this.review_readcount = review_readcount;
		this.member_id = member_id;
		this.review_content = review_content;
	}
	
	public int getReview_no() {
		return review_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getReview_path() {
		return review_path;
	}
	public void setReview_path(String review_path) {
		this.review_path = review_path;
	}
	public int getReview_readcount() {
		return review_readcount;
	}
	public void setReview_readcount(int review_readcount) {
		this.review_readcount = review_readcount;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setommentcount(int commentCount) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String toString() {
		return "ReviewDto [review_no=" + review_no + ", review_title=" + review_title + ", review_date=" + review_date
				+ ", review_path=" + review_path + ", review_readcount=" + review_readcount + ", member_id=" + member_id
				+ ", review_content=" + review_content + "]";
	}
	
	
}