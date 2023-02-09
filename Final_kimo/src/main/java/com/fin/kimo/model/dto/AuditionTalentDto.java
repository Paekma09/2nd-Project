package com.fin.kimo.model.dto;

public class AuditionTalentDto {

	private String audition_no;
	
	private String atalent_music;
	private String atalent_dance;
	private String atalent_sports;
	private String atalent_language;
	private String atalent_etc;
	public AuditionTalentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuditionTalentDto(String audition_no, String atalent_music, String atalent_dance, String atalent_sports,
			String atalent_language, String atalent_etc) {
		super();
		this.audition_no = audition_no;
		this.atalent_music = atalent_music;
		this.atalent_dance = atalent_dance;
		this.atalent_sports = atalent_sports;
		this.atalent_language = atalent_language;
		this.atalent_etc = atalent_etc;
	}
	public String getAudition_no() {
		return audition_no;
	}
	public void setAudition_no(String audition_no) {
		this.audition_no = audition_no;
	}
	public String getatalent_music() {
		return atalent_music;
	}
	public void setatalent_music(String atalent_music) {
		this.atalent_music = atalent_music;
	}
	public String getatalent_dance() {
		return atalent_dance;
	}
	public void setatalent_dance(String atalent_dance) {
		this.atalent_dance = atalent_dance;
	}
	public String getatalent_sports() {
		return atalent_sports;
	}
	public void setatalent_sports(String atalent_sports) {
		this.atalent_sports = atalent_sports;
	}
	public String getatalent_language() {
		return atalent_language;
	}
	public void setatalent_language(String atalent_language) {
		this.atalent_language = atalent_language;
	}
	public String getatalent_etc() {
		return atalent_etc;
	}
	public void setatalent_etc(String atalent_etc) {
		this.atalent_etc = atalent_etc;
	}
	@Override
	public String toString() {
		return "AuditionTalentDto [audition_no=" + audition_no + ", atalent_music=" + atalent_music + ", aatalent_dance="
				+ atalent_dance + ", atalent_sports=" + atalent_sports + ", atalent_language=" + atalent_language
				+ ", atalent_etc=" + atalent_etc + "]";
	}
	
	
	
	
	
	
}
	
	
	
	