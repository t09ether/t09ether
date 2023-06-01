package com.t09ether.home.service;

import java.util.List;

import com.t09ether.home.dto.OnlinePagingVO;
import com.t09ether.home.dto.ProductDTO;
import com.t09ether.home.dto.RegisterDTO;

public interface ProductService {
	public int productInsert(ProductDTO dto);
	public int totalRecord(OnlinePagingVO vo);
	public List<ProductDTO> pageSelect(OnlinePagingVO vo);
	public ProductDTO productDetailSelect(int pro_code);
}
