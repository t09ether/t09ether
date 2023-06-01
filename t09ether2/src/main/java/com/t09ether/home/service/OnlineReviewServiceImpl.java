package com.t09ether.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.OnlineReviewDAO;
import com.t09ether.home.dto.OnlineReviewDTO;

@Service
public class OnlineReviewServiceImpl implements OnlineReviewService{

	@Inject
	OnlineReviewDAO dao;

	@Override
	public List<OnlineReviewDTO> selectReview(int pro_code) {
		return dao.selectReview(pro_code);
	}

	@Override
	public double rateAvg(int pro_code) {
		return dao.rateAvg(pro_code);
	}

	@Override
	public List<String> userList(int pro_code) {
		return dao.userList(pro_code);
	}

	@Override
	public int reviewInsert(OnlineReviewDTO dto) {
		return dao.reviewInsert(dto);
	}

	@Override
	public int reviewDel(int on_r_no) {
		return dao.reviewDel(on_r_no);
	}

	@Override
	public int proCodeSelect(int on_r_no) {
		return dao.proCodeSelect(on_r_no);
	}
	
}
