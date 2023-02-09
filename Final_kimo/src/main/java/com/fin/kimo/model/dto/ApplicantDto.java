package com.fin.kimo.model.dto;

import java.sql.Date;

public class ApplicantDto {

	private int applicant_no;
	private String member_id;
	private int audition_no;
	private String port_title;
	private String audition_situation;
	
	private String audition_title;
	private Date audition_end;
	private String member_name;
	public ApplicantDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApplicantDto(int applicant_no, String member_id, int audition_no, String port_title,
			String audition_situation, String audition_title, Date audition_end, String member_name) {
		super();
		this.applicant_no = applicant_no;
		this.member_id = member_id;
		this.audition_no = audition_no;
		this.port_title = port_title;
		this.audition_situation = audition_situation;
		this.audition_title = audition_title;
		this.audition_end = audition_end;
		this.member_name = member_name;
	}
	public int getApplicant_no() {
		return applicant_no;
	}
	public void setApplicant_no(int applicant_no) {
		this.applicant_no = applicant_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getAudition_no() {
		return audition_no;
	}
	public void setAudition_no(int audition_no) {
		this.audition_no = audition_no;
	}
	public String getPort_title() {
		return port_title;
	}
	public void setPort_title(String port_title) {
		this.port_title = port_title;
	}
	public String getAudition_situation() {
		return audition_situation;
	}
	public void setAudition_situation(String audition_situation) {
		this.audition_situation = audition_situation;
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
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	@Override
	public String toString() {
		return "ApplicantDto [applicant_no=" + applicant_no + ", member_id=" + member_id + ", audition_no="
				+ audition_no + ", port_title=" + port_title + ", audition_situation=" + audition_situation
				+ ", audition_title=" + audition_title + ", audition_end=" + audition_end + ", member_name="
				+ member_name + "]";
	}
	
}
