package com.t09ether.home.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.t09ether.home.dto.OnlinePagingVO;
import com.t09ether.home.dto.OnlineReviewDTO;
import com.t09ether.home.dto.ProductDTO;
import com.t09ether.home.dto.SearchVO;
import com.t09ether.home.service.OnlineReviewService;
import com.t09ether.home.service.ProductService;

@RestController
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService service;
	@Autowired
	OnlineReviewService reviewservice;
	
	@GetMapping("/productWrite")
	public ModelAndView productIn() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/productWrite");
		return mav;
	}
	
	@PostMapping("/productWriteOk")
	public ResponseEntity<String> boardWriteOk(ProductDTO dto) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		//상품등록 실패하면 예외발생
		try {
			service.productInsert(dto);
			String htmlTag = "<script>location.href='/<%=request.getContextPath() %>';</script>";
			entity = new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			String htmlTag = "<script>"; 
			htmlTag += "alert('상품이 등록되지 않았습니다.');";
			htmlTag += "history.back();";
			htmlTag += "</script>";
			entity = new ResponseEntity<String>(htmlTag, headers, HttpStatus.BAD_REQUEST);
		}
		return entity; 
		
	}
	
	@GetMapping("/onlineGB")
	public ModelAndView onlineGB(int pro_code, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("userid");
		ProductDTO dto = service.productDetailSelect(pro_code);
		mav.addObject("dto", dto); //선택 레코드
		mav.setViewName("/online/onlineGB");
		return mav;
	}
	
	@GetMapping("/onlineHome")
	public ModelAndView online(OnlinePagingVO vo) {
		ModelAndView mav = new ModelAndView();
		
		//총레코드수
		
		 vo.setTotalRecord(service.totalRecord(vo));
		 mav.addObject("vo", vo);
	
		//해당페이지 레코드 선택하기
		List<ProductDTO> list = service.pageSelect(vo);
		for(int i=0;i<list.size();i++) {
			double rateAvg=0;
			if(reviewservice.selectReview(list.get(i).getPro_code()).size()>0) {
			 rateAvg = reviewservice.rateAvg(list.get(i).getPro_code());
			}
			list.get(i).setRateAvg(rateAvg);
		}
		mav.addObject("list", list);
		mav.setViewName("/online/onlineList");
		return mav;
	}
	
	@GetMapping("/productDetail")
	public ModelAndView productDetail(int pro_code, HttpSession session ,SearchVO vo) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		ProductDTO dto = service.productDetailSelect(pro_code);

		List<OnlineReviewDTO> list = reviewservice.selectReview(pro_code);
		
		double rateAvg=0;
		if(list.size()>0) {
			rateAvg = reviewservice.rateAvg(pro_code);
			System.out.println(rateAvg);
			/*rateAvg = (rateAvg/5)*100;
			System.out.println(rateAvg);
			*/
		}
		mav.addObject("rateAvg", rateAvg);
		mav.addObject("dto", dto); //선택 레코드
		mav.addObject("vo", vo);//검색어
		mav.setViewName("/online/productDetail");
		return mav;
	}
}
