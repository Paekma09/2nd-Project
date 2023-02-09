package com.fin.kimo.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

//@NoArgsConstructor
//@Data
public class PortfolioDto {
	
	private String port_title;
	private String port_essay;
	private Date port_date;
	private String member_id;
	
	public PortfolioDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PortfolioDto(String port_title, String port_essay, Date port_date,
			String member_id) {
		super();
		this.port_title = port_title;
		this.port_essay = port_essay;
		this.port_date = port_date;
		this.member_id = member_id;
	}
	
	
	public String getPort_title() {
		return port_title;
	}

	public void setPort_title(String port_title) {
		this.port_title = port_title;
	}

	public String getPort_essay() {
		return port_essay;
	}

	public void setPort_essay(String port_essay) {
		this.port_essay = port_essay;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setPort_date(Date port_date) {
		this.port_date = port_date;
	}

	public String getPort_date() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(port_date);
    }

	@Override
	public String toString() {
		return "PortfolioDto [port_title=" + port_title + ", port_essay=" + port_essay + ", port_date=" + port_date
				+ ", member_id=" + member_id + "]";
	}
	
	
	

}
