package com.fin.kimo.model.dto;

import java.util.Date;

public class ReviewCommentDto {
	
	private int comment_no;
	private int review_no;
	private String comment_detail;
	private Date comment_date;
	private String member_id;
	
	private String member_name;
	
	public ReviewCommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewCommentDto(int comment_no, int review_no, String comment_detail, Date comment_date, String member_id, String member_name) {
		super();
		this.comment_no = comment_no;
		this.review_no = review_no;
		this.comment_detail = comment_detail;
		this.comment_date = comment_date;
		this.member_id = member_id;
		this.member_name = member_name;
	
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getComment_detail() {
		return comment_detail;
	}
	public void setComment_detail(String comment_detail) {
		this.comment_detail = comment_detail;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ReviewCommentDto [comment_no=" + comment_no + ", review_no=" + review_no + ", comment_detail="
				+ comment_detail + ", comment_date=" + comment_date + ", member_id=" + member_id + ", member_name="
				+ member_name + "]";
	}
	
	
	

}
