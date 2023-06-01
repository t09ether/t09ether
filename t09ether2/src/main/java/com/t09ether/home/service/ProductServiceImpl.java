package com.t09ether.home.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.ProductDAO;
import com.t09ether.home.dto.OnlinePagingVO;
import com.t09ether.home.dto.ProductDTO;
import com.t09ether.home.dto.RegisterDTO;

@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	ProductDAO dao;
	
	@Override
	public int productInsert(ProductDTO dto) {		
		return dao.productInsert(dto);
	}
	
	@Override
	public int totalRecord(OnlinePagingVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public List<ProductDTO> pageSelect(OnlinePagingVO vo) {
		return dao.pageSelect(vo);
	}

	@Override
	public ProductDTO productDetailSelect(int pro_code) {
		return dao.productDetailSelect(pro_code);
	}
}
