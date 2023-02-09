package com.fin.kimo.model.dto;

public class EduDto {
	
	private int edu_id;
	private String edu_firstPeriod;
	private String edu_endPeriod;
	private String edu_school;
	private String edu_schoolName;
	private String edu_major;
	private String edu_graduated;
	private String port_title;
	
	public EduDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EduDto(int edu_id, String edu_firstPeriod, String edu_endPeriod, String edu_school, String edu_schoolName,
			String edu_major, String edu_graduated, String port_title) {
		super();
		this.edu_id = edu_id;
		this.edu_firstPeriod = edu_firstPeriod;
		this.edu_endPeriod = edu_endPeriod;
		this.edu_school = edu_school;
		this.edu_schoolName = edu_schoolName;
		this.edu_major = edu_major;
		this.edu_graduated = edu_graduated;
		this.port_title = port_title;
	}

	public int getEdu_id() {
		return edu_id;
	}

	public void setEdu_id(int edu_id) {
		this.edu_id = edu_id;
	}

	public String getEdu_firstPeriod() {
		return edu_firstPeriod;
	}

	public void setEdu_firstPeriod(String edu_firstPeriod) {
		this.edu_firstPeriod = edu_firstPeriod;
	}

	public String getEdu_endPeriod() {
		return edu_endPeriod;
	}

	public void setEdu_endPeriod(String edu_endPeriod) {
		this.edu_endPeriod = edu_endPeriod;
	}

	public String getEdu_school() {
		return edu_school;
	}

	public void setEdu_school(String edu_school) {
		this.edu_school = edu_school;
	}

	public String getEdu_schoolName() {
		return edu_schoolName;
	}

	public void setEdu_schoolName(String edu_schoolName) {
		this.edu_schoolName = edu_schoolName;
	}

	public String getEdu_major() {
		return edu_major;
	}

	public void setEdu_major(String edu_major) {
		this.edu_major = edu_major;
	}

	public String getEdu_graduated() {
		return edu_graduated;
	}

	public void setEdu_graduated(String edu_graduated) {
		this.edu_graduated = edu_graduated;
	}

	public String getPort_title() {
		return port_title;
	}

	public void setPort_title(String port_title) {
		this.port_title = port_title;
	}

	@Override
	public String toString() {
		return "EduDto [edu_id=" + edu_id + ", edu_firstPeriod=" + edu_firstPeriod + ", edu_endPeriod=" + edu_endPeriod
				+ ", edu_school=" + edu_school + ", edu_schoolName=" + edu_schoolName + ", edu_major=" + edu_major
				+ ", edu_graduated=" + edu_graduated + ", port_title=" + port_title + "]";
	}

	
	
	

}
