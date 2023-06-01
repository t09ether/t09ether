package com.t09ether.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t09ether.home.dto.OrderDTO;
import com.t09ether.home.dto.ProductDTO;

public interface OnlineJoinDAO {
	
	//나눔장소목록선택
	public List<OrderDTO> locationListSelect(int pro_code);
		
	//나눔목록지도
	public List<OrderDTO> getList(@Param("pro_code")int pro_code, @Param("searchWrd")String searchWrd);
		
	//나눔장소목록(검색어)
	public List<OrderDTO> getSearchList(@Param("pro_code")int pro_code, @Param("searchWrd")String searchWrd);
	
	//주문상품정보가져오기
	public ProductDTO proInfor(int pro_code);
	
	//회원정보
	public OrderDTO userInfor(String userid);
	
	//ord_no select
	public int ordNoSelect(OrderDTO dto);
	
	//주문 DB에 넣기
	public int orderInsert(OrderDTO dto);
	
	//rest_count update
	public int restUpdate(OrderDTO dto);
	
	//status update
	public int statusUpdate(int on_no);
	
	//tel가져오기
	public List<OrderDTO> selectInfor(int on_no);
	
	//final_amount가져오기
	public int finalSelect(int ord_no);
	
	//할인 가격으로 DB업데이트
	public int updatePrice(@Param("finalNum")int finalNum, @Param("ord_on")int ord_no);

}
