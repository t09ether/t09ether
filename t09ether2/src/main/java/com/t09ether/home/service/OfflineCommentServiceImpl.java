package com.t09ether.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t09ether.home.dao.OfflineCommentDAO;
import com.t09ether.home.dto.OfflineCommentDTO;

@Service
public class OfflineCommentServiceImpl implements OfflineCommentService {
	@Autowired
	OfflineCommentDAO dao;
	
	@Override
	public List<OfflineCommentDTO> commentListSelect(int off_no) {
		return dao.commentListSelect(off_no);
	}

	@Override
	public int commentInsert(OfflineCommentDTO dto) {
		return dao.commentInsert(dto);
	}

	@Override
	public int commentUpdate(OfflineCommentDTO dto) {
		return dao.commentUpdate(dto);
	}

	@Override
	public int commentDelete(int comment_no, String userid) {
		return dao.commentDelete(comment_no, userid);
	}

}
