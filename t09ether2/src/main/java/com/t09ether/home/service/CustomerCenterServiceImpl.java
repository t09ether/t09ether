package com.t09ether.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.CustomerCenterDAO;
import com.t09ether.home.dao.RegisterDAO;
import com.t09ether.home.dto.CustomerCenterDTO;
import com.t09ether.home.dto.CustomerCenterPagingVO;
import com.t09ether.home.dto.RegisterDTO;

@Service
public class CustomerCenterServiceImpl implements CustomerCenterService {
	@Inject
	CustomerCenterDAO dao;

	@Override
	public int totalRecord(CustomerCenterPagingVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public List<CustomerCenterDTO> pageSelect(CustomerCenterPagingVO vo) {
	
		return dao.pageSelect(vo);
	}

	@Override
	public int csBoardInsert(CustomerCenterDTO cdto) {
		return dao.csBoardInsert(cdto);
	}

	@Override
	public CustomerCenterDTO csBoardEditSelect(int cus_b_num) {
		return dao.csBoardEditSelect(cus_b_num);
	}

	@Override
	public int csBoardUpdate(CustomerCenterDTO cdto) {
		return dao.csBoardUpdate(cdto);
	}

	@Override
	public CustomerCenterDTO csBoardSelect(int cus_b_num) {
		return dao.csBoardSelect(cus_b_num);
	}

	@Override
	public int csBoardDelete(CustomerCenterDTO cdto) {
		return dao.csBoardDelete(cdto);
	}



}
