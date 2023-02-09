package com.fin.kimo.model.dto;

import java.sql.Date;

public class BookmarkDto {
	private int bookmark_no;
	
	private int audition_no;
	private String member_id;
	
	private String audition_title;
	private Date audition_end;
	
	public BookmarkDto() {
		super();
	}

	public BookmarkDto(int bookmark_no, int audition_no, String member_id, String audition_title, Date audition_end) {
		super();
		this.bookmark_no = bookmark_no;
		this.audition_no = audition_no;
		this.member_id = member_id;
		this.audition_title = audition_title;
		this.audition_end = audition_end;
	}

	public int getBookmark_no() {
		return bookmark_no;
	}

	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
	}

	public int getAudition_no() {
		return audition_no;
	}

	public void setAudition_no(int audition_no) {
		this.audition_no = audition_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getAudition_title() {
		return audition_title;
	}

	public void setAudition_title(String audition_title) {
		this.audition_title = audition_title;
	}

	public Date getAudition_end() {
		return audition_end;
	}

	public void setAudition_end(Date audition_end) {
		this.audition_end = audition_end;
	}

	@Override
	public String toString() {
		return "BookmarkDto [bookmark_no=" + bookmark_no + ", audition_no=" + audition_no + ", member_id=" + member_id
				+ ", audition_title=" + audition_title + ", audition_end=" + audition_end + "]";
	}

	
	
	
}
