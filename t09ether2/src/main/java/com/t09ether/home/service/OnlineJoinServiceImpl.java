package com.t09ether.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.OnlineJoinDAO;
import com.t09ether.home.dto.OrderDTO;
import com.t09ether.home.dto.ProductDTO;

@Service
public class OnlineJoinServiceImpl implements OnlineJoinService {
	@Inject
	OnlineJoinDAO dao;

	@Override
	public List<OrderDTO> locationListSelect(int pro_code) {
		return dao.locationListSelect(pro_code);
	}

	@Override
	public List<OrderDTO> getList(int pro_code, String searchWrd) {
		return dao.getList(pro_code, searchWrd);
	}

	@Override
	public List<OrderDTO> getSearchList(int pro_code, String searchWrd) {
		return dao.getSearchList(pro_code, searchWrd);
	}

	@Override
	public ProductDTO proInfor(int on_no) {
		return dao.proInfor(on_no);
	}

	@Override
	public OrderDTO userInfor(String userid) {
		return dao.userInfor(userid);
	}

	@Override
	public int orderInsert(OrderDTO dto) {
		return dao.orderInsert(dto);
	}

	@Override
	public int restUpdate(OrderDTO dto) {
		return dao.restUpdate(dto);
	}

	@Override
	public int ordNoSelect(OrderDTO dto) {
		return dao.ordNoSelect(dto);
	}


	@Override
	public List<OrderDTO> selectInfor(int on_no) {
		return dao.selectInfor(on_no);
	}

	@Override
	public int finalSelect(int ord_no) {
		return dao.finalSelect(ord_no);
	}

	@Override
	public int updatePrice(int finalNum, int ord_no) {
		return dao.updatePrice(finalNum, ord_no);
	}
	@Override
	public int statusUpdate(int on_no) {
		return dao.statusUpdate(on_no);

	}


	
}
