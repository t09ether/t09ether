package com.t09ether.home.dto;

public class RefundDTO {
	private int refund_no;
	private String pay_no;
	private int refund_amount;
	private int refund_count;
	private int refund_date;
	
	@Override
	public String toString() {
		return "RefundDTO [refund_no=" + refund_no + ", ord_no=" + pay_no + ", refund_amount=" + refund_amount
				+ ", refund_count=" + refund_count + ", refund_date=" + refund_date + "]";
	}
	
	public int getRefund_no() {
		return refund_no;
	}
	public void setRefund_no(int refund_no) {
		this.refund_no = refund_no;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public int getRefund_amount() {
		return refund_amount;
	}
	public void setRefund_amount(int refund_amount) {
		this.refund_amount = refund_amount;
	}
	public int getRefund_count() {
		return refund_count;
	}
	public void setRefund_count(int refund_count) {
		this.refund_count = refund_count;
	}
	public int getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(int refund_date) {
		this.refund_date = refund_date;
	}
	
	
	
}
