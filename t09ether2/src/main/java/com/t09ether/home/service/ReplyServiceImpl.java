package com.t09ether.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.ReplyDAO;
import com.t09ether.home.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	ReplyDAO dao;
	
	@Override
	public int replyInsert(ReplyDTO rdto) {
		return dao.replyInsert(rdto);
	}

	@Override
	public List<ReplyDTO> replyListSelect(int cus_b_num) {
		return dao.replyListSelect(cus_b_num);
	}

	@Override
	public int replyUpdate(ReplyDTO rdto) {
		return dao.replyUpdate(rdto);
	}

	@Override
	public int replyDelete(int reply_num, String userid) {
		return dao.replyDelete(reply_num, userid);
	}

}
