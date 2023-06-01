package com.t09ether.home.service;

import java.util.List;

import com.t09ether.home.dto.OnlineReviewDTO;

public interface OnlineReviewService {
	public List<OnlineReviewDTO> selectReview(int pro_code);
	public double rateAvg(int pro_code);
	public List<String> userList(int pro_code);
	public int reviewInsert(OnlineReviewDTO dto);
	public int reviewDel(int on_r_no);
	public int proCodeSelect(int on_r_no);
}
