package com.t09ether.home.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t09ether.home.dto.OnlineDTO;
import com.t09ether.home.dto.OrderDTO;
import com.t09ether.home.dto.ProductDTO;

public interface OnlineJoinService {
	//나눔장소목록선택
	public List<OrderDTO> locationListSelect(int pro_code);
	//나눔목록지도
	public List<OrderDTO> getList(int pro_code, String searchWrd);
	public List<OrderDTO> getSearchList(int pro_code, String searchWrd);
	public ProductDTO proInfor(int pro_code);
	public OrderDTO userInfor(String userid);
	public int orderInsert(OrderDTO dto);
	public int restUpdate(OrderDTO dto);
	public int ordNoSelect(OrderDTO dto);
	public int statusUpdate(int on_no);
	public List<OrderDTO> selectInfor(int on_no);
	public int finalSelect(int ord_no);
	public int updatePrice(int finalNum, int ord_no);
}
