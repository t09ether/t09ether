package com.t09ether.home.service;

import com.t09ether.home.dto.OnlineDTO;
import com.t09ether.home.dto.OrderDTO;

public interface OrderService {
	public int orderInsert(OrderDTO dto);
	public int onlineInsert(OnlineDTO dto);
	public OrderDTO orderSelect(int pro_code, int on_no, String userid);
	public int orderDelete(int ord_no);
	public int product_detailDelete(int on_no);
	public int restCountSelect(int on_no);
	public int restCountUpdate(int on_no, int rest_count);
}
