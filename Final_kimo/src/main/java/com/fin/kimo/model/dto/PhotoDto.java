package com.fin.kimo.model.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//@NoArgsConstructor
//@Data
public class PhotoDto {
	
	private int photo_no;
	private String photo_orgName;
	private String photo_saveName;
	private String photo_path;
	private String port_title;

	public PhotoDto() {
		super();
	}

//	@Builder
	public PhotoDto(int photo_no, String photo_orgName, String photo_saveName, String photo_path, String port_title) {
		super();
		this.photo_no = photo_no;
		this.photo_orgName = photo_orgName;
		this.photo_saveName = photo_saveName;
		this.photo_path = photo_path;
		this.port_title = port_title;
	}

	public int getPhoto_no() {
		return photo_no;
	}

	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}

	public String getPhoto_orgName() {
		return photo_orgName;
	}

	public void setPhoto_orgName(String photo_orgName) {
		this.photo_orgName = photo_orgName;
	}

	public String getPhoto_saveName() {
		return photo_saveName;
	}

	public void setPhoto_saveName(String photo_saveName) {
		this.photo_saveName = photo_saveName;
	}

	public String getPhoto_path() {
		return photo_path;
	}

	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}

	public String getPort_title() {
		return port_title;
	}

	public void setPort_title(String port_title) {
		this.port_title = port_title;
	}

	@Override
	public String toString() {
		return "PhotoDto [photo_no=" + photo_no + ", photo_orgName=" + photo_orgName + ", photo_saveName="
				+ photo_saveName + ", photo_path=" + photo_path + ", port_title=" + port_title + "]";
	}
	
	
	
	
	
	

}
