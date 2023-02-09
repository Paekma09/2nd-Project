package com.fin.kimo.model.dto;

import java.sql.Date;

public class AuditionDto {
	private int audition_no;
	private String member_id;
	
	private String audition_employ;
	private String audition_job;
	private String audition_title;
	private String audition_director;
	private String audition_company;
	private String audition_type;
	private String audition_location;
	private String audition_pay;
	private String audition_detail;
	private String audition_phone;
	private String audition_date;
	private Date audition_start;
	private Date audition_end;
	private Date audition_submit;
	private String audition_option;
	private boolean audition_status;
	
	private String audition_keyword;
	private String audition_body;
	
	public AuditionDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuditionDto(int audition_no, String member_id, String audition_employ, String audition_job,
			String audition_title, String audition_director, String audition_company, String audition_type,
			String audition_location, String audition_pay, String audition_detail, String audition_phone,
			String audition_date, Date audition_start, Date audition_end, Date audition_submit, String audition_option,
			boolean audition_status, String audition_keyword, String audition_body) {
		super();
		this.audition_no = audition_no;
		this.member_id = member_id;
		this.audition_employ = audition_employ;
		this.audition_job = audition_job;
		this.audition_title = audition_title;
		this.audition_director = audition_director;
		this.audition_company = audition_company;
		this.audition_type = audition_type;
		this.audition_location = audition_location;
		this.audition_pay = audition_pay;
		this.audition_detail = audition_detail;
		this.audition_phone = audition_phone;
		this.audition_date = audition_date;
		this.audition_start = audition_start;
		this.audition_end = audition_end;
		this.audition_submit = audition_submit;
		this.audition_option = audition_option;
		this.audition_status = audition_status;
		this.audition_keyword = audition_keyword;
		this.audition_body = audition_body;
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

	public String getAudition_employ() {
		return audition_employ;
	}

	public void setAudition_employ(String audition_employ) {
		this.audition_employ = audition_employ;
	}

	public String getAudition_job() {
		return audition_job;
	}

	public void setAudition_job(String audition_job) {
		this.audition_job = audition_job;
	}

	public String getAudition_title() {
		return audition_title;
	}

	public void setAudition_title(String audition_title) {
		this.audition_title = audition_title;
	}

	public String getAudition_director() {
		return audition_director;
	}

	public void setAudition_director(String audition_director) {
		this.audition_director = audition_director;
	}

	public String getAudition_company() {
		return audition_company;
	}

	public void setAudition_company(String audition_company) {
		this.audition_company = audition_company;
	}

	public String getAudition_type() {
		return audition_type;
	}

	public void setAudition_type(String audition_type) {
		this.audition_type = audition_type;
	}

	public String getAudition_location() {
		return audition_location;
	}

	public void setAudition_location(String audition_location) {
		this.audition_location = audition_location;
	}

	public String getAudition_pay() {
		return audition_pay;
	}

	public void setAudition_pay(String audition_pay) {
		this.audition_pay = audition_pay;
	}

	public String getAudition_detail() {
		return audition_detail;
	}

	public void setAudition_detail(String audition_detail) {
		this.audition_detail = audition_detail;
	}

	public String getAudition_phone() {
		return audition_phone;
	}

	public void setAudition_phone(String audition_phone) {
		this.audition_phone = audition_phone;
	}

	public String getAudition_date() {
		return audition_date;
	}

	public void setAudition_date(String audition_date) {
		this.audition_date = audition_date;
	}

	public Date getAudition_start() {
		return audition_start;
	}

	public void setAudition_start(Date audition_start) {
		this.audition_start = audition_start;
	}

	public Date getAudition_end() {
		return audition_end;
	}

	public void setAudition_end(Date audition_end) {
		this.audition_end = audition_end;
	}

	public Date getAudition_submit() {
		return audition_submit;
	}

	public void setAudition_submit(Date audition_submit) {
		this.audition_submit = audition_submit;
	}

	public String getAudition_option() {
		return audition_option;
	}

	public void setAudition_option(String audition_option) {
		this.audition_option = audition_option;
	}

	public boolean isAudition_status() {
		return audition_status;
	}

	public void setAudition_status(boolean audition_status) {
		this.audition_status = audition_status;
	}

	public String getaudition_keyword() {
		return audition_keyword;
	}

	public void setaudition_keyword(String audition_keyword) {
		this.audition_keyword = audition_keyword;
	}

	public String getAudition_body() {
		return audition_body;
	}

	public void setAudition_body(String audition_body) {
		this.audition_body = audition_body;
	}

	@Override
	public String toString() {
		return "AuditionDto [audition_no=" + audition_no + ", member_id=" + member_id + ", audition_employ="
				+ audition_employ + ", audition_job=" + audition_job + ", audition_title=" + audition_title
				+ ", audition_director=" + audition_director + ", audition_company=" + audition_company
				+ ", audition_type=" + audition_type + ", audition_location=" + audition_location + ", audition_pay="
				+ audition_pay + ", audition_detail=" + audition_detail + ", audition_phone=" + audition_phone
				+ ", audition_date=" + audition_date + ", audition_start=" + audition_start + ", audition_end="
				+ audition_end + ", audition_submit=" + audition_submit + ", audition_option=" + audition_option
				+ ", audition_status=" + audition_status + ", audition_keyword=" + audition_keyword + ", audition_body="
				+ audition_body + "]";
	}
	
	
	

	
	
	
	
}
