package com.t09ether.home.service;

import java.util.List;

import com.t09ether.home.dto.CustomerCenterDTO;
import com.t09ether.home.dto.CustomerCenterPagingVO;
import com.t09ether.home.dto.RegisterDTO;

public interface CustomerCenterService {
	
	public int totalRecord(CustomerCenterPagingVO vo);
	// 해당페이지 선택
	public List<CustomerCenterDTO> pageSelect(CustomerCenterPagingVO vo);
	// 고객센터 글쓰기
	public int csBoardInsert(CustomerCenterDTO cdto);
	// 고객센터 faqlist에서 글수정
	public CustomerCenterDTO csBoardEditSelect(int cus_b_num);
	// 고객센터 글 수정한것 업데이트
	public int csBoardUpdate(CustomerCenterDTO cdto);
	
	public CustomerCenterDTO csBoardSelect(int cus_b_num);
	
	public int csBoardDelete(CustomerCenterDTO cdto);
	
}
