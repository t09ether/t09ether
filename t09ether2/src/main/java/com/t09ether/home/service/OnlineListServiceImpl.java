package com.t09ether.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.OnlineListDAO;
import com.t09ether.home.dto.OnlineDTO;

@Service
public class OnlineListServiceImpl implements OnlineListService {
	@Inject
	OnlineListDAO dao;

	//@Override
	//public OnlineDTO productDetailMakeSelect(int pro_code) {
	//	return dao.productDetailMakeSelect(pro_code);
	//}

	//@Override
	//public OnlineDTO productDetailSelect(int pro_code) {
	//	return dao.productDetailSelect(pro_code);
	//}
	
	
	
}
