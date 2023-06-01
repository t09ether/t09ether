package com.t09ether.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t09ether.home.dto.PaymentDTO;
import com.t09ether.home.dto.RefundDTO;

public interface PaymentDAO {
	public int payInsert(@Param("imp_uid")String imp_uid, @Param("merchant_uid") String merchant_uid, @Param("final_amount")int final_amount, @Param("discount_amount") int discount_amount, @Param("ord_no") int ord_no, @Param("total_amount") int total_amount);
	public PaymentDTO paymentSelect(int ord_no);
	public int refundInsert(@Param("ord_no")int ord_no, @Param("amount")int amount, @Param("ord_count")int ord_count);
	public int payDelete(String pay_no);
	public int ordUpdate(@Param("ord_no")int ord_no, @Param("on_no")int on_no);
	public int prodetailUpdate(int on_no);
	public String masterSelect(int on_no);
	public List<PaymentDTO> paySubSelect(int on_no);
	public int ordUpdateJoin(int ord_no);
	public int restCountSelect(int on_no);
	public int restCountUpdate(@Param("newRest")int newRest, @Param("on_no")int on_no);
}