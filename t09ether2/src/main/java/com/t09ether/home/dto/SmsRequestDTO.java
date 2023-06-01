package com.t09ether.home.dto;

import java.util.List;

public class SmsRequestDTO {
	private String type;
	private String contentType;
	private String contryCode;
	private String from;
	private String content;
	private List<MessageDTO> messages;
	
	@Override
	public String toString() {
		return "SmsRequestDTO [type=" + type + ", contentType=" + contentType + ", contryCode=" + contryCode + ", from="
				+ from + ", content=" + content + ", messages=" + messages + "]";
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getContryCode() {
		return contryCode;
	}
	public void setContryCode(String contryCode) {
		this.contryCode = contryCode;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<MessageDTO> getMessages() {
		return messages;
	}
	public void setMessages(List<MessageDTO> messages) {
		this.messages = messages;
	}
}
