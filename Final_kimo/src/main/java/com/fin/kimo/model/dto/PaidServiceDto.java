
package com.fin.kimo.model.dto;

import java.util.Date;

public class PaidServiceDto {
	private int service_no;
	private String service_title;
	private Date service_date;
	private Date service_end;
	private String service_method;
	private String member_id;
	public PaidServiceDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getService_no() {
		return service_no;
	}
	public void setService_no(int service_no) {
		this.service_no = service_no;
	}
	public String getService_title() {
		return service_title;
	}
	public void setService_title(String service_title) {
		this.service_title = service_title;
	}
	public Date getService_date() {
		return service_date;
	}
	public void setService_date(Date service_date) {
		this.service_date = service_date;
	}
	public Date getService_end() {
		return service_end;
	}
	public void setService_end(Date service_end) {
		this.service_end = service_end;
	}
	public String getService_method() {
		return service_method;
	}
	public void setService_method(String service_method) {
		this.service_method = service_method;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}