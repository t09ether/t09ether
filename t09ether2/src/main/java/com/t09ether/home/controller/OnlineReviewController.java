package com.t09ether.home.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.t09ether.home.dto.OnlineReviewDTO;
import com.t09ether.home.dto.ProductDTO;
import com.t09ether.home.service.OnlineJoinService;
import com.t09ether.home.service.OnlineReviewService;

@RestController
@RequestMapping("/online")
public class OnlineReviewController {

	@Autowired
	OnlineReviewService service;
	
	@Autowired
	OnlineJoinService joinservice;
	
	@GetMapping("/onlineReview")
	public ModelAndView onlineReview(int pro_code) {
		System.out.println(pro_code);
		ModelAndView mav = new ModelAndView();
		ProductDTO dto = joinservice.proInfor(pro_code);
		
		Map rating = new HashMap();
		rating.put(0, "☆☆☆☆☆");
		rating.put(1, "★☆☆☆☆");
		rating.put(2, "★★☆☆☆");
		rating.put(3, "★★★☆☆");
		rating.put(4, "★★★★☆");
		rating.put(5, "★★★★★");
		
		List<OnlineReviewDTO> list = service.selectReview(pro_code);
		
		double rateAvg=0;
		if(list.size()>0) {
			rateAvg = service.rateAvg(pro_code);
			System.out.println(rateAvg);
			/*rateAvg = (rateAvg/5)*100;
			System.out.println(rateAvg);
			*/
		}
		
		
		//물품을 구매한 userid select
		List<String> userList = service.userList(pro_code);
		
		mav.addObject("userList",userList);
		mav.addObject("rateAvg", rateAvg);
		mav.addObject("list", list);
		mav.addObject("rating", rating);
		mav.addObject("dto", dto);
		mav.setViewName("/online/onlineReview");
		
		return mav;
		
	}
	//리뷰 DB등록
	@PostMapping("/reviewOk")
	public int reviewOk(OnlineReviewDTO dto, HttpServletRequest req ){
		dto.setUserid((String)req.getSession().getAttribute("logId"));
		System.out.println(dto.content);
		System.out.println("등록준비");
		return service.reviewInsert(dto);
	}
	
	//리뷰 삭제
	@GetMapping("/reviewDel")
	public int reviewDel(int on_r_no) {
		return service.reviewDel(on_r_no);
		//System.out.println("리뷰제거 성공");
		//return service.proCodeSelect(on_r_no);
	}
}
