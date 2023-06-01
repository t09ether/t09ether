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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.t09ether.home.dao.RegisterDAO;
import com.t09ether.home.dto.CustomerCenterDTO;
import com.t09ether.home.dto.CustomerCenterPagingVO;
import com.t09ether.home.dto.RegisterDTO;
import com.t09ether.home.service.CustomerCenterService;
import com.t09ether.home.service.CustomerCenterServiceImpl;

@RestController
@RequestMapping("/customer")
public class CustomerCenterController {
	
	@Autowired
	CustomerCenterService service;
	
	@GetMapping("/customerBoard")
	public ModelAndView customerBoard(CustomerCenterPagingVO vo) {
		ModelAndView mav = new ModelAndView();
		
		//userid = session.getAttribute(null);
		//String rank = service.bringRank(userid);
		//System.out.println("rank: "+ rank);
		
		// 게시판 글 리스트 전체 목록 보여주기
		
		//페이징
		vo.setTotalRecord(service.totalRecord(vo));
		mav.addObject("list",service.pageSelect(vo));
		mav.addObject("vo",vo);
		mav.setViewName("customer/customerBoard");
		
		return mav;
	}
	
	@GetMapping("/csBoardWrite")
	public ModelAndView csBoardWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/csBoardWrite");
		
		return mav;
	}
	
	@PostMapping("/csBoardWriteOk")
	public ResponseEntity<String> csBoardInsert(CustomerCenterDTO cdto, HttpServletRequest request) {
		cdto.setUserid((String)request.getSession().getAttribute("logId"));
		
		String htmlTag = "<script>";
		
		// 예외발생시 처리
		try {
			int result = service.csBoardInsert(cdto);
			//service.csBoardInsert(cdto);
			htmlTag += "location.href='/home/customer/customerBoard';";
		
		}catch(Exception e) {
			htmlTag += "alert('Q&A 문의글을 등록하는데 실패했습니다');";
			htmlTag += "history.back();";
			e.printStackTrace();
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
		
	}
	
	@GetMapping("/csBoardEdit")
	public ModelAndView boardEdit(int cus_b_num, CustomerCenterPagingVO vo) {
		CustomerCenterDTO cdto = service.csBoardEditSelect(cus_b_num);
		
		//"   "    '     ' 내용에 따옴표가 있으면
		String subject = cdto.getSubject().replaceAll("\"", "&quot;");	// "  \"
		subject.replaceAll("'", "&#39;");
		//System.out.println(subject);
		cdto.setSubject(subject);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cdto", cdto);
		mav.addObject("vo", vo);
		
		mav.setViewName("customer/csBoardEdit");
		
		return mav;
		
	}
	
	//수정(DB update)
		@PostMapping("/csBoardEditOk")
		public ResponseEntity<String> csBoardEditOk(CustomerCenterDTO cdto, CustomerCenterPagingVO vo, HttpSession session) {
			//no레코드 번호, 로그인 아이디가 같을 때 업데이트 해야 함
			cdto.setUserid((String)session.getAttribute("logId"));
			//String kkk = cdto.getUserid();
			//System.out.println("유저아이디는 :"+kkk);
			String bodyTag = "<script>";
			try {
				service.csBoardUpdate(cdto);
				// location.href='boardView?no=12&nowPage=2&searchKey=subject&searchWord=한화';
				bodyTag += "location.href='faqlist?cus_b_num="+cdto.getCus_b_num()+"&nowPage="+vo.getNowPage();
				if(vo.getSearchWord()!=null) { //검색어가 있으면 ~
					bodyTag += "&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord();
				}
				bodyTag += "';";
				
			}catch(Exception e) {
				//수정 실패
				e.printStackTrace();
				bodyTag += "alert('글 수정하는데 실패했습니다.');";
				bodyTag += "history.back();";
			}
			bodyTag += "</script>";
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
			headers.add("Content-Type", "text/html; charset=UTF-8");
			
			
			ResponseEntity<String> entity = new ResponseEntity<String>(bodyTag, headers, HttpStatus.OK);
			
			return entity;
		}
		
		// 삭제
		@GetMapping("/csBoardDel")
		public ModelAndView boardDel(CustomerCenterDTO cdto, CustomerCenterPagingVO vo, HttpSession session) {
			cdto.setUserid((String) session.getAttribute("logId"));
			int result = service.csBoardDelete(cdto);

			ModelAndView mav = new ModelAndView();

			// 페이지정보
			mav.addObject("nowPage", vo.getNowPage());
			if (vo.getSearchWord() != null) { // 검색어 있을 때
				mav.addObject("searchKey", vo.getSearchKey());
				mav.addObject("searchWord", vo.getSearchWord());
			}
			if (result > 0) { // 삭제되었음. 리스트로 이동시키기
				mav.setViewName("redirect:customerBoard");
			} else { // 삭제 실패 글 내용보기로 이동시키기
				mav.addObject("cus_b_num", cdto.getCus_b_num());
				mav.setViewName("redirect:faqlist");
			}

			return mav;
		}

	@GetMapping("/faqlist")
	public ModelAndView faqlist(int cus_b_num, CustomerCenterDTO ccdto, CustomerCenterPagingVO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		ccdto = service.csBoardSelect(cus_b_num);
		mav.addObject("CustomerCenterDTO",ccdto);
		mav.addObject("vo",vo);
		mav.setViewName("customer/faqlist");

		return mav;
		
	}
}
