package com.t09ether.home.service;

import java.util.List;

import com.t09ether.home.dto.OfflineReviewDTO;

public interface OfflineReviewService {
	public int offlineReviewInsert(OfflineReviewDTO dto);
	public List<OfflineReviewDTO> reviewSelect(String userid);
	public int reviewCount(String userid);
}
