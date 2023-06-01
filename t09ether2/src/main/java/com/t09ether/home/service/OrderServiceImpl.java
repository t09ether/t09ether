package com.t09ether.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.OrderDAO;
import com.t09ether.home.dto.OnlineDTO;
import com.t09ether.home.dto.OrderDTO;


@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO dao;
	
	@Override
	public int orderInsert(OrderDTO dto) {
		return dao.orderInsert(dto);
	}

	@Override
	public int onlineInsert(OnlineDTO dto) {
		return dao.onlineInsert(dto);
	}

	@Override
	public OrderDTO orderSelect(int pro_code, int on_no, String userid) {
		return dao.orderSelect(pro_code, on_no, userid);
	}


	@Override
	public int orderDelete(int ord_no) {
		return dao.orderDelete(ord_no);
	}

	@Override
	public int product_detailDelete(int on_no) {
		return dao.product_detailDelete(on_no);
	}

	@Override
	public int restCountSelect(int on_no) {
		return dao.restCountSelect(on_no);
	}

	@Override
	public int restCountUpdate(int on_no, int rest_count) {
		return dao.restCountUpdate(on_no, rest_count);
	}


}
