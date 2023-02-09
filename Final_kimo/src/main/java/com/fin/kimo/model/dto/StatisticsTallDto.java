
package com.fin.kimo.model.dto;

import java.util.Date;

public class StatisticsTallDto {
	
	  private String member_gender;
	  
	  private String member_tall;

	public StatisticsTallDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_tall() {
		return member_tall;
	}

	public void setMember_tall(String member_tall) {
		this.member_tall = member_tall;
	}

	@Override
	public String toString() {
		return "StatisticsTallDto [member_gender=" + member_gender + ", member_tall=" + member_tall + "]";
	}
	  
	  
	
}
