package com.fin.kimo.model.dto;

public class MemberDto {
	
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_addr;
	private String member_phone;
	private String member_email;
	private String member_birth;
	private String member_type;
	private String member_admin;
	private String member_gender;
	private String member_tall;
	private String member_keyword;
	private String member_body;
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(String member_id, String member_password, String member_name, String member_addr,
			String member_phone, String member_email, String member_birth, String member_type, String member_admin,
			String member_gender, String member_tall, String member_keyword, String member_body) {
		super();
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_addr = member_addr;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_birth = member_birth;
		this.member_type = member_type;
		this.member_admin = member_admin;
		this.member_gender = member_gender;
		this.member_tall = member_tall;
		this.member_keyword = member_keyword;
		this.member_body = member_body;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public String getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(String member_admin) {
		this.member_admin = member_admin;
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
	public String getMember_keyword() {
		return member_keyword;
	}
	public void setMember_keyword(String member_keyword) {
		this.member_keyword = member_keyword;
	}
	public String getMember_body() {
		return member_body;
	}
	public void setMember_body(String member_body) {
		this.member_body = member_body;
	}

	@Override
	public String toString() {
		return "MemberDto [member_id=" + member_id + ", member_password=" + member_password + ", member_name="
				+ member_name + ", member_addr=" + member_addr + ", member_phone=" + member_phone + ", member_email="
				+ member_email + ", member_birth=" + member_birth + ", member_type=" + member_type + ", member_admin="
				+ member_admin + ", member_gender=" + member_gender + ", member_tall=" + member_tall
				+ ", member_keyword=" + member_keyword + ", member_body=" + member_body + "]";
	}
	
	
	

}
