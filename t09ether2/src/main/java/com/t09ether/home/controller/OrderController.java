package com.t09ether.home.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.t09ether.home.dto.OnlineDTO;
import com.t09ether.home.dto.OrderDTO;
import com.t09ether.home.dto.PaymentDTO;
import com.t09ether.home.service.OrderService;

@RestController
@RequestMapping("/order")
public class OrderController {

   @Autowired
   OrderService service;
   
   
   @PostMapping("/paytestInfo")
   public ModelAndView payTest(OrderDTO dto, OnlineDTO odto, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      //ResponseEntity<String> entity = null;
      //HttpHeaders headers = new HttpHeaders();
      //headers.add("Content-Type", "text/html; charset=utf-8");

      System.out.println((String)session.getAttribute("logId"));
      dto.setUserid((String)session.getAttribute("logId"));
      odto.setUserid((String)session.getAttribute("logId"));
      //dto.setRest_count(dto.getRest_count()- dto.getOrd_count()); -> update문 메소드
      System.out.println(dto.toString());
      System.out.println(odto.toString());
      int pro_code = dto.getPro_code();
      String userid = dto.getUserid();
      
      
      //상품등록 실패하면 예외발생
      try {
         service.onlineInsert(odto);
         int on_no = odto.getOn_no();
         System.out.println(on_no);
         dto.setOn_no(on_no);
         service.orderInsert(dto);
         
         OrderDTO sdto = service.orderSelect(pro_code, on_no, userid);
         mav.addObject("sdto", sdto);
         mav.setViewName("online/payRes");
         System.out.println("요기까지");
         //service.orderSelect(dto.getPro_code());
         //String htmlTag = "<script>location.href='/home/online/payRes';</script>";
         //entity = new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
         
      }catch(Exception e) {
         e.printStackTrace();
         //String htmlTag = "<script>"; 
         //htmlTag += "alert('상품이 등록되지 않았습니다.');";
         //htmlTag += "history.back();";
         //htmlTag += "</script>";
         //entity = new ResponseEntity<String>(htmlTag, headers, HttpStatus.BAD_REQUEST);
      }
      return mav; 
      
   }
   
   @PostMapping("/orderDelete")
   public ResponseEntity<Map<String, Object>> orderDelete(@RequestBody OrderDTO data) {
	    Map<String, Object> result = new HashMap<String, Object>();
	    System.out.println(data.toString());
	    try {
	        int deleteOrderResult = service.orderDelete(data.getOrd_no());
	        int deleteProductDetailResult = service.product_detailDelete(data.getOn_no());
	        System.out.println(deleteProductDetailResult);
	        if (deleteOrderResult > 0 && deleteProductDetailResult > 0) {
	            result.put("success", true);
	            result.put("message", "주문 및 상세 정보 삭제 완료");
	            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
	        } else {
	            result.put("success", false);
	            result.put("message", "주문 및 상세 정보 삭제 실패");
	            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.BAD_REQUEST);
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	        result.put("success", false);
	        result.put("message", "서버 오류: " + e.getMessage());
	        return new ResponseEntity<Map<String, Object>>(result, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
   
   @PostMapping("/orderDeleteJoin")
   public ResponseEntity<Map<String, Object>> orderDelectJoin(@RequestBody OrderDTO data) {
	    Map<String, Object> result = new HashMap<String, Object>();
	    System.out.println(data.toString());
	    try {
	        //product_detail의 rest_count update
	    	data.setRest_count(service.restCountSelect(data.getOn_no()));
	        service.restCountUpdate(data.getOn_no(), data.getRest_count());
	    	//order09 DB삭제
	        int deleteOrderResult = service.orderDelete(data.getOrd_no());
	        
	        if(deleteOrderResult >0) {
	        	result.put("success", true);
	        	result.put("message", "주문 및 상세 정보 삭제 완료");
	        	return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
	        }else {
	            result.put("success", false);
	            result.put("message", "주문 및 상세 정보 삭제 실패");
	            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.BAD_REQUEST);
	        } 
	    } catch (Exception e) {
	    	e.printStackTrace();
	        result.put("success", false);
	        result.put("message", "서버 오류: " + e.getMessage());
	        return new ResponseEntity<Map<String, Object>>(result, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
   }
}