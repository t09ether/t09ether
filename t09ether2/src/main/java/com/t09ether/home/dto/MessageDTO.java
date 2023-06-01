package com.t09ether.home.dto;

public class MessageDTO {
	private String to;
	private String content = "";
	
	
	@Override
	public String toString() {
		return "MessageDTO [to=" + to + ", content=" + content + "]";
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
