package com.t09ether.home.service;

import java.util.List;

import com.t09ether.home.dto.OfflineCommentDTO;

public interface OfflineCommentService {
	public List<OfflineCommentDTO> commentListSelect(int off_no);
	public int commentInsert(OfflineCommentDTO dto);
	public int commentUpdate(OfflineCommentDTO dto);
	public int commentDelete(int comment_no, String userid);
}
