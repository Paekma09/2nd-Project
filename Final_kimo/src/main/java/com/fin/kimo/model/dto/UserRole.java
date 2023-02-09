package com.fin.kimo.model.dto;

import lombok.Getter;

@Getter
public enum UserRole {
	ADMIN("ROLE_ADMIN"),
	USER("ROLE_USER");
	
	UserRole(String value) {
		this.setValue(value);
	}
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private String value;
}
