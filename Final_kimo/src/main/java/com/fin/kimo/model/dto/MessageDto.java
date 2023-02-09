package com.fin.kimo.model.dto;

import java.sql.Date;

public class MessageDto {
	private int message_no;
	private String message_content;
	private Date message_date;
	private boolean message_read;
	
	private String message_title;
	private String message_send;
	
	private String member_id;

	public MessageDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MessageDto(int message_no, String message_content, Date message_date, boolean message_read,
			String message_title, String message_send, String member_id) {
		super();
		this.message_no = message_no;
		this.message_content = message_content;
		this.message_date = message_date;
		this.message_read = message_read;
		this.message_title = message_title;
		this.message_send = message_send;
		this.member_id = member_id;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	public boolean isMessage_read() {
		return message_read;
	}

	public void setMessage_read(boolean message_read) {
		this.message_read = message_read;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_send() {
		return message_send;
	}

	public void setMessage_send(String message_send) {
		this.message_send = message_send;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "MessageDto [message_no=" + message_no + ", message_content=" + message_content + ", message_date="
				+ message_date + ", message_read=" + message_read + ", message_title=" + message_title
				+ ", message_send=" + message_send + ", member_id=" + member_id + "]";
	}
	
	
	
	

	
	
	
	
}
