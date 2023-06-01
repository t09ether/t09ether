package com.t09ether.home.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t09ether.home.dto.OnlineDTO;
import com.t09ether.home.dto.OrderDTO;

public interface OrderDAO {
	public int orderInsert(OrderDTO dto);
	public int onlineInsert(OnlineDTO dto);
	public OrderDTO orderSelect(@Param ("pro_code")int pro_code, @Param ("on_no")int on_no, @Param ("userid")String userid);

	public int orderDelete(int ord_no);
	public int product_detailDelete(int on_no);
	public int restCountSelect(int on_no);
	public int restCountUpdate(int on_no, int rest_count);
}
