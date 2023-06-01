package com.t09ether.home.dto;

import java.time.LocalDateTime;

public class SmsResponseDTO {
	private String requestId;
	private LocalDateTime requestTime;
	private String statusCode;
	private String statusName;
	
	
	
	@Override
	public String toString() {
		return "SmsResponseDTO [requestId=" + requestId + ", requestTime=" + requestTime + ", statusCode=" + statusCode
				+ ", statusName=" + statusName + "]";
	}
	public String getRequestId() {
		return requestId;
	}
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}
	public LocalDateTime getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(LocalDateTime requestTime) {
		this.requestTime = requestTime;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
}
