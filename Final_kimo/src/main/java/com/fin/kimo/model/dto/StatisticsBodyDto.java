
package com.fin.kimo.model.dto;


public class StatisticsBodyDto {
	
	  private String member_gender;
	  
	  private String member_body;

	public StatisticsBodyDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_body() {
		return member_body;
	}

	public void setMember_body(String member_body) {
		this.member_body = member_body;
	}

	@Override
	public String toString() {
		return "StatisticsBodyDto [member_gender=" + member_gender + ", member_body=" + member_body + "]";
	}

	
}
