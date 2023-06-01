package com.t09ether.home.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.t09ether.home.dto.ReportDTO;
import com.t09ether.home.service.OfflineReportService;
import com.t09ether.home.service.OfflineService;

@Controller
public class OfflineReportController {
	@Autowired
	OfflineReportService service;
	
	/*
	 신고종류(target_type)
	 1~6 : 온라인
	 7: 약속시간 안지킴
	 8: 연락안됨
	 9: 매너안좋음
	 10: 직접입력 
	 */
	
	//offlineView 신고하기버튼-> 신고 작성 폼으로 이동
	@PostMapping("/offlineReport")
	public ModelAndView goReportForm(String target_id, int off_no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String mem_id = (String)request.getSession().getAttribute("logId");
		
		mav.addObject("off_no", off_no);
		mav.addObject("target_id", target_id);
		mav.addObject("mem_id", mem_id);
		mav.setViewName("/offline/offlineReportWrite");
		return mav;
	}
	
	//신고등록(DB)
	@PostMapping("/offlineReportInsertOk")
	public ResponseEntity<String> offlineReportInsertOk(ReportDTO rDTO,String target_id, HttpServletRequest request){
		String mem_id = (String)request.getSession().getAttribute("logId");
		//신고DTO
		rDTO.setMem_id(mem_id);
		rDTO.setTarget_id(target_id);
		//신고등록
		String htmlTag = "<script>";
		try {
			int result = service.offlineReportInsert(rDTO);
			htmlTag += "location.href='offline';";
		}catch(Exception e) {
			e.printStackTrace();
			htmlTag += "alert('글이 등록되지않았습니다.');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";
		//결과
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
				
		System.out.println("신고 등록 성공....");
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);	
	}
	
}
