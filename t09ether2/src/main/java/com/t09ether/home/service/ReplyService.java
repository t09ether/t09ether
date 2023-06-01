package com.t09ether.home.service;

import java.util.List;

import com.t09ether.home.dto.ReplyDTO;

public interface ReplyService {
	//댓글 등록
	public int replyInsert(ReplyDTO rdto);
	//댓글 목록
	public List<ReplyDTO> replyListSelect(int cus_b_num);
	//댓글 수정
	public int replyUpdate(ReplyDTO rdto);
	//댓글 삭제
	public int replyDelete(int reply_num, String userid);
}
