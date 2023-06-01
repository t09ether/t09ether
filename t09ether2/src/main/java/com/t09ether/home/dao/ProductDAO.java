package com.t09ether.home.dao;

import java.util.List;

import com.t09ether.home.dto.OnlinePagingVO;
import com.t09ether.home.dto.ProductDTO;
import com.t09ether.home.dto.RegisterDTO;

public interface ProductDAO {
	
	//상품등록
	public int productInsert(ProductDTO dto); 
	
	//총레코드수
	public int totalRecord(OnlinePagingVO vo);
	
	//해당페이지 선택
	public List<ProductDTO> pageSelect(OnlinePagingVO vo);
	
	//공구만들기&상품상세출력
	public ProductDTO productDetailSelect(int pro_code);
	
	
}
