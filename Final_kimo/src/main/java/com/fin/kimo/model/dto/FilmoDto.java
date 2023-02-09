package com.fin.kimo.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

//@NoArgsConstructor
//@Data
public class FilmoDto {
	private int filmo_id;
	private String filmo_title;
	private String filmo_div;
	private String filmo_imp;
	private String filmo_name;
	private String port_title;
	
	
	public FilmoDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public FilmoDto(int filmo_id, String filmo_title, String filmo_div, String filmo_imp, String filmo_name,
			String port_title) {
		super();
		this.filmo_id = filmo_id;
		this.filmo_title = filmo_title;
		this.filmo_div = filmo_div;
		this.filmo_imp = filmo_imp;
		this.filmo_name = filmo_name;
		this.port_title = port_title;
	}


	public int getFilmo_id() {
		return filmo_id;
	}


	public void setFilmo_id(int filmo_id) {
		this.filmo_id = filmo_id;
	}


	public String getFilmo_title() {
		return filmo_title;
	}


	public void setFilmo_title(String filmo_title) {
		this.filmo_title = filmo_title;
	}


	public String getFilmo_div() {
		return filmo_div;
	}


	public void setFilmo_div(String filmo_div) {
		this.filmo_div = filmo_div;
	}


	public String getFilmo_imp() {
		return filmo_imp;
	}


	public void setFilmo_imp(String filmo_imp) {
		this.filmo_imp = filmo_imp;
	}


	public String getFilmo_name() {
		return filmo_name;
	}


	public void setFilmo_name(String filmo_name) {
		this.filmo_name = filmo_name;
	}


	public String getPort_title() {
		return port_title;
	}


	public void setPort_title(String port_title) {
		this.port_title = port_title;
	}


	@Override
	public String toString() {
		return "FilmoDto [filmo_id=" + filmo_id + ", filmo_title=" + filmo_title + ", filmo_div=" + filmo_div
				+ ", filmo_imp=" + filmo_imp + ", filmo_name=" + filmo_name + ", port_title=" + port_title + "]";
	}

	
	
	
	
	
	
	
}
