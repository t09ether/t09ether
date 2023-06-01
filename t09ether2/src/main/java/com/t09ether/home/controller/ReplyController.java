package com.t09ether.home.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.t09ether.home.dto.ReplyDTO;
import com.t09ether.home.service.ReplyService;

@RestController
public class ReplyController {
	@Autowired
	ReplyService service;
	// 댓글 입력
	@PostMapping("/replySend")
	public String replySend(ReplyDTO rdto, HttpServletRequest request) {
		rdto.setUserid((String)request.getSession().getAttribute("logId"));
		
		int result = service.replyInsert(rdto);
		
		return result+"";
	}
	// 댓글 목록 나열
	@GetMapping("/replyList")
	public List<ReplyDTO> replyList(int cus_b_num) {
		return service.replyListSelect(cus_b_num);
	}
	
	// 댓글 수정
	@PostMapping("/replyEdit")
	public String replyEdit(ReplyDTO rdto, HttpSession session) {
		rdto.setUserid((String)session.getAttribute("logId"));
		int result = service.replyUpdate(rdto);
		return String.valueOf(result);
	}
	
	// 댓글 삭제
	@GetMapping("/replyDelete")
	public String replyDelete(int reply_num, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		return String.valueOf(service.replyDelete(reply_num, userid));
	}
}
