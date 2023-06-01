package com.t09ether.home.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.t09ether.home.dto.AdminOrderPagingVO;
import com.t09ether.home.dto.AdminPagingVO;

import com.t09ether.home.dto.MyPageDTO;
import com.t09ether.home.dto.MyPostPagingVO;
import com.t09ether.home.dto.MyPostPagingVO2;
import com.t09ether.home.dto.OffPartDTO;
import com.t09ether.home.dto.OrderDTO;
import com.t09ether.home.dto.ReportDTO;
import com.t09ether.home.service.MyPageService;

@RestController
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	MyPageService service;
	
	@GetMapping("/myPage")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myPage");
		
		return mav;		
	}
	
	@GetMapping("/myOrder")
	public ModelAndView myOrder(AdminPagingVO vo, AdminOrderPagingVO vo2,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)session.getAttribute("logId"));
		vo2.setUserid((String)session.getAttribute("logId"));
		
//		System.out.println(vo.getUserid());
//		System.out.println(vo2.getUserid());
		vo.setTotalRecord(service.totalOrdRecord(vo));
		vo2.setTotalRecord(service.totalOrdSucRecord(vo2));
		System.out.println(vo.toString());
		System.out.println(vo2.toString());
		
		List<OrderDTO> list = service.pageOrdSelect(vo);
		List<OrderDTO> list2 = service.pageOrdSucSelect(vo2);
		//System.out.println(list);
		System.out.println(vo2);
		
		mav.addObject("vo", vo);
		mav.addObject("vo2", vo2);
		mav.addObject("list", list);
		mav.addObject("list2",list2);
		mav.setViewName("mypage/myOrder");
		return mav;
	}
	
	@GetMapping("/joinSuc")
	public ModelAndView myOrderSuc(AdminPagingVO vo, AdminOrderPagingVO vo2, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)session.getAttribute("logId"));
		vo2.setUserid((String)session.getAttribute("logId"));
		
		System.out.println(vo.getOn_no());
		
		try {
			int result = service.myOrderSucUpdate(vo.getOn_no());
			if(result>0) {
				int result2 = service.expUpdate(vo.getUserid());
				if(result2>0) {
					int exp = service.expSelect(vo.getUserid());
					if(exp==10) {
						service.rankUpdate(vo.getUserid());
					}else if(exp==30) {
						service.rankUpdate(vo.getUserid());
					}else if(exp==60) {
						service.rankUpdate(vo.getUserid());
					}else if(exp==100) {
						service.rankUpdate(vo.getUserid());
					}
					
					mav.addObject("errorMsg", "만남완료 및 경험치 업데이트 성공");
					mav.setViewName("mypage/joinStatus");
				}else {
					mav.addObject("errorMsg",  "만남완료 업데이트 성공, 경험치 업데이트 실패");
					mav.setViewName("mypage/joinStatus");
				}
			}else {
				mav.addObject("errorMsg", "만남완료 업데이트 실패");
				mav.setViewName("mypage/joinStatus");
			}
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject("errorMsg", "만남완료 업데이트 실패");
			mav.setViewName("mypage/joinStatus");
		}
		return mav;
	}
	
	
	@GetMapping("/myPost")
	public ModelAndView myPost(MyPostPagingVO vo, MyPostPagingVO2 vo2, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		vo.setUserid((String)session.getAttribute("logId"));
		vo2.setUserid((String)session.getAttribute("logId"));
		
		vo.setTotalRecord(service.mpTotalRecord(vo));
		vo2.setTotalRecord(service.mpTotalSucRecord(vo2));
		//System.out.println(vo.toString());
		
		List<OffPartDTO> list = service.offPageSelect(vo);
		List<OffPartDTO> list2 = service.offPageSucSelect(vo2);
		System.out.println(vo2.toString());
		System.out.println(list);
		
		mav.addObject("vo", vo);
		mav.addObject("vo2", vo2);
		mav.addObject("list", list);
		mav.addObject("list2",list2);
		mav.setViewName("mypage/myPost");
		return mav;
	}
	
	@GetMapping("/myPostView")
	public ModelAndView myPostView(int no, MyPostPagingVO vo) {
		
		OffPartDTO dto = service.boardSelect(no);
		List<OffPartDTO> list = service.offPartList(no);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto", dto);
		mav.addObject("vo", vo);
		mav.addObject("list", list);
		mav.setViewName("mypage/myPostView");
		
		return mav;
	}
	
	@GetMapping("/myPersInfo")
	public ModelAndView myPersInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myPersInfo");
		
		return mav;
	}
	
	@GetMapping("/myPersInfo_IdChk")
		public ModelAndView myPersInfo_IdChk(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		String username = (String)session.getAttribute("logName");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", userid);
		mav.addObject("username", username);
		mav.setViewName("mypage/myPersInfo_IdChk");
		
		return mav;
	}
	
	@PostMapping("psInfoEdit")
	public ModelAndView psInfoEdit(String userid, String userpwd, HttpServletRequest request, HttpSession session) {
		MyPageDTO dto = service.loginOk(userid, userpwd);
		
		ModelAndView mav = new ModelAndView();
		if(dto!=null) { //성공
			
			dto = service.mpRegisterEdit((String)session.getAttribute("logId"));
			mav.addObject("dto", dto);
			
			mav.setViewName("mypage/myPersInfo");
			
		}else { //실패
			mav.addObject("msg", "비밀번호를 확인해주세요.");
			mav.setViewName("mypage/psInfoEditResult");
		}
		return mav;
	}
	
	@PostMapping("/psInfoEditOk1")
	public ModelAndView psInfoEditOk1(MyPageDTO dto, HttpSession session) {
		
		dto.setUserid((String)session.getAttribute("logId"));
		
		int cnt = service.mpRegisterEditOk1(dto);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.addObject("msg","회원 정보를 수정하였습니다.");
			mav.setViewName("mypage/psInfoResultS");
		}else {
			mav.addObject("msg","회원 정보 수정에 실패하였습니다.");
			mav.setViewName("mypage/psInfoResult");
		}
		
		return mav;
	}
	
	
	@PostMapping("/psInfoEditOk2")
	public ModelAndView psInfoEditOk2(MyPageDTO dto, HttpSession session) {
		
		dto.setUserid((String)session.getAttribute("logId"));
		
		int cnt = service.mpRegisterEditOk2(dto);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.addObject("msg","회원 정보를 수정하였습니다.");
			mav.setViewName("mypage/psInfoResultS");
		}else {
			mav.addObject("msg","회원 정보 수정에 실패하였습니다.");
			mav.setViewName("mypage/psInfoResult");
		}
		
		return mav;
	}
	
	@GetMapping("/reportWrite")
	public ModelAndView reportWrite(String pd_userid, int ord_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("ord_no", ord_no);
		mav.addObject("pd_userid", pd_userid);
		mav.setViewName("mypage/reportWrite");
		return mav;
	}
	
	@PostMapping("/reportWriteOk")
	public ResponseEntity<String> reportWriteOk(ReportDTO dto, HttpSession session){
		dto.setMem_id((String)session.getAttribute("logId"));
		System.out.println(dto.toString());
		String htmlTag = "<script>";
		try {
			int result = service.reportInsert(dto);
			//select
			int result2= service.orderStatusUpdate(dto.getOrd_no());
	         
	         if(result>0 && result2>0) {
	            htmlTag += "alert('신고가 등록되었습니다.');";
	            htmlTag += "location.href='myOrder';";
	         }else {
	            htmlTag += "alert('신고가 등록되지 않았습니다.');";
	            htmlTag += "history.back();";
	         }
		}catch(Exception e) {
			e.printStackTrace();
			htmlTag += "alert('신고가 등록되지 않았습니다.');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charser=UTF-8");
		
		//                       내용
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
	}
	
	/*@Autowired
	�¶��ΰ�������Service service;
	
	*/
	
}
