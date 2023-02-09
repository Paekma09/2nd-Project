package com.fin.kimo.model.dto;

public class Talent {

	private String member_id;
	private String talent_music;
	private String talent_dance;
	private String talent_sports;
	private String talent_language;
	private String talent_etc;
	
	public Talent() {
		super();
	}

	public Talent(String member_id, String talent_music, String talent_dance, String talent_sports,
			String talent_language, String talent_etc) {
		super();
		this.member_id = member_id;
		this.talent_music = talent_music;
		this.talent_dance = talent_dance;
		this.talent_sports = talent_sports;
		this.talent_language = talent_language;
		this.talent_etc = talent_etc;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getTalent_music() {
		return talent_music;
	}

	public void setTalent_music(String talent_music) {
		this.talent_music = talent_music;
	}

	public String getTalent_dance() {
		return talent_dance;
	}

	public void setTalent_dance(String talent_dance) {
		this.talent_dance = talent_dance;
	}

	public String getTalent_sports() {
		return talent_sports;
	}

	public void setTalent_sports(String talent_sports) {
		this.talent_sports = talent_sports;
	}

	public String getTalent_language() {
		return talent_language;
	}

	public void setTalent_language(String talent_language) {
		this.talent_language = talent_language;
	}

	public String getTalent_etc() {
		return talent_etc;
	}

	public void setTalent_etc(String talent_etc) {
		this.talent_etc = talent_etc;
	}

	@Override
	public String toString() {
		return "Talent [member_id=" + member_id + ", talent_music=" + talent_music + ", talent_dance=" + talent_dance
				+ ", talent_sports=" + talent_sports + ", talent_language=" + talent_language + ", talent_etc="
				+ talent_etc + "]";
	}
	
	
}
	
	
	
	