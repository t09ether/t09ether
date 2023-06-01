package com.t09ether.home.dto;

import java.util.List;

public class ReportDTO {
	private int report_no;
	private String mem_id;
	private String target_id;
	private int target_type;
	private String report_content;
	private String writedate;
	
	private int ord_no;

	private int report;

	private List<Integer> noList;

	
	
	@Override
	public String toString() {
		return "ReportDTO [report_no=" + report_no + ", mem_id=" + mem_id + ", target_id=" + target_id
				+ ", target_type=" + target_type + ", report_content=" + report_content + ", writedate=" + writedate
				+ ", ord_no=" + ord_no + ", report=" + report + ", noList=" + noList + "]";
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public int getTarget_type() {
		return target_type;
	}

	public void setTarget_type(int target_type) {
		this.target_type = target_type;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public List<Integer> getNoList() {
		return noList;
	}

	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}

	
	
	
}

