package com.t09ether.home.dao;

import java.util.List;

import com.t09ether.home.dto.OfflineReviewDTO;

public interface OfflineReviewDAO {
	//리뷰등록
	public int offlineReviewInsert(OfflineReviewDTO dto);
	//리뷰검색(아이디)
	public List<OfflineReviewDTO> reviewSelect(String userid);
	//리뷰개수(아이디)
	public int reviewCount(String userid);
}
