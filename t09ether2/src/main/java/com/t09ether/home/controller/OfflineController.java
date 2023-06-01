package com.t09ether.home.controller;

import java.nio.charset.Charset;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.t09ether.home.dto.OffPartDTO;

import com.t09ether.home.dto.OfflineParticipantDTO;
import com.t09ether.home.dto.OfflineCommentDTO;
import com.t09ether.home.dto.OfflineDTO;
import com.t09ether.home.dto.OfflinePagingVO;
import com.t09ether.home.dto.OfflineReviewDTO;
import com.t09ether.home.dto.RegisterDTO;
import com.t09ether.home.service.OfflineCommentService;
import com.t09ether.home.service.OfflineReviewService;
import com.t09ether.home.service.OfflineService;

@RestController
public class OfflineController extends SmsSend{
	@Autowired
	OfflineService service;
	@Autowired
	OfflineCommentService commentService;
	@Autowired
	OfflineReviewService reviewService;
	
	//게시판목록
	@GetMapping("/offline")
	public ModelAndView offline(OfflinePagingVO vo) {		
		ModelAndView mav = new ModelAndView();			
		//총레코드수
		vo.setTotalRecord(service.totalRecord(vo));
		
		List<OfflineDTO> list = new ArrayList<OfflineDTO>();
		list = service.offList(vo);//해당페이지 레코드 선택하기

		mav.addObject("list", list);		
		mav.addObject("list", service.offList(vo));		
		mav.addObject("vo", vo);
		mav.setViewName("offline/offline_board");
		return mav;
	}
	
	//글작성폼으로이동
	@GetMapping("/offlineWrite")
	public ModelAndView offlineWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("offline/offlineWrite");
		return mav;
	}
	
	//글등록(DB) -> 공구 생성
	@PostMapping("/offlineInsert")	
	public ResponseEntity<String> offlineInsert(OfflineDTO dto, HttpServletRequest request) {
		
		//로그인아이디
		String userid = (String)request.getSession().getAttribute("logId");

		dto.setUserid(userid);		
		
		String htmlTag="<script>";
		try {//글등록성공
			int result = service.offlineInsert(dto);//DB등록
			
			//글등록성공하면 작성자를 참가자(off_participant)에 추가
			RegisterDTO rDTO = service.getParticipant(userid); //userid를 이용해 작성자 회원정보를 가져와
			OfflineParticipantDTO opDTO = new OfflineParticipantDTO();
			//DB의 offline_participant테이블에 insert한다
			opDTO.setOff_no(dto.getOff_no());
			opDTO.setUserid(userid);
			opDTO.setUsername(rDTO.getUsername());
			opDTO.setTel(rDTO.getTelAst());
			
			service.participantInsert(opDTO);//작성자->참여자 등록
			
			System.out.println("원글번호(dto.off_no)="+dto.getOff_no());
			
			System.out.println("작성자정보 : "+opDTO.toString());
		
			htmlTag += "location.href='offline';";
		}catch(Exception e) {//글등록실패
			e.printStackTrace();
			htmlTag += "alert('글이등록되지않았습니다.');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";

		//결과
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		System.out.println(dto.toString());		
		
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);	
	}
	
	//글내용보기
	@GetMapping("/offlineView")
	public ModelAndView boardView(int off_no, OfflinePagingVO vo,HttpServletRequest request) {
		//현재 로그인한 사람의 아이디
		String nowId = (String)request.getSession().getAttribute("logId");
		//조회수증가
		service.offlineHitCount(off_no);
		//해당글(off_no)담기

		OfflineDTO dto = service.offlineSelect(off_no);		
		dto.setCurrent_num(service.currentNumCount(off_no));
		//참가자들 담기
		List<OfflineParticipantDTO> list = service.participantList(off_no);
		List<String> idList = service.getIds(off_no);
		ModelAndView mav = new ModelAndView();		
		
		mav.addObject("nowId", nowId);
		mav.addObject("dto", dto); //선택한레코드
		mav.addObject("list", list);//참여자들
		mav.addObject("idList", idList);//참여자들(아이디만)
		mav.addObject("vo", vo); // 페이지번호, 검색어, 검색키
		
		mav.setViewName("offline/offlineView");
		return mav;
	}
	
	//수정폼으로 이동
	@GetMapping("/offlineEdit")
	public ModelAndView boardEdit(int off_no, OfflinePagingVO vo) {
		OfflineDTO dto = service.offlineEditSelect(off_no);
			
		String subject = dto.getOff_subject().replaceAll("\"", "&quot;");
		subject.replaceAll("'", "&#39;");
		System.out.println(subject);
		dto.setOff_subject(subject);
		ModelAndView mav = new ModelAndView();
			
		mav.addObject("dto", dto);
		mav.addObject("vo", vo);
			
		mav.setViewName("offline/offlineEdit");
			
		return mav;
		}	
	
	//글수정(DB등록)
	@PostMapping("/offlineEditOk")
	public ResponseEntity<String> offlineEditOk(OfflineDTO dto, OfflinePagingVO vo, HttpSession session) {
		
		// no(레코드번호), 로그인 아이디가 같을 때 업데이트
		dto.setUserid((String)session.getAttribute("logId"));
		System.out.println(dto.getUserid());
		String bodyTag= "<script>";
		try {
			service.offlineUpdate(dto);
			bodyTag += "location.href='offlineView?off_no=" + dto.getOff_no()+ "&nowPage=" + vo.getNowPage();
			if(vo.getSearchWord()!= null) {
				bodyTag += "&searchKey=" + vo.getSearchKey() + "&searchWord=" + vo.getSearchWord();
			}
			bodyTag += "';";
			System.out.println(bodyTag);
		}catch(Exception e) {			
			//수정실패			
			bodyTag +="alert('게시판 글수정 실패하였습니다');";
			bodyTag +="history.back();";
			System.out.println(bodyTag);
			e.printStackTrace();
		}
		bodyTag += "</script>";
		System.out.println(bodyTag);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		ResponseEntity<String> entity = new ResponseEntity<String>(bodyTag,headers,HttpStatus.OK);
		
		return entity;
	}	
	//삭제
	@GetMapping("/offlineDel")
	public ModelAndView offlineDel(OfflineDTO dto, OfflinePagingVO vo, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
			
		int result = service.offlineDelete(dto);
			
		ModelAndView mav = new ModelAndView();
			
		mav.addObject("nowPage", vo.getNowPage());
			if(vo.getSearchWord()!=null) {
				mav.addObject("searchKey", vo.getSearchKey());
				mav.addObject("searchWord", vo.getSearchWord());
			}
			if(result>0) {//삭제시 리스트로 이동
				mav.setViewName("redirect:offline");
				System.out.println("삭제 성공...!");
			}else {//삭제실패시 글내용보기로 이동
				mav.addObject("off_no", dto.getOff_no());
				mav.setViewName("redirect:offlineView");
			}
			return mav;
		}

	//오프라인 공구 참여 
	// 마감X-> 오프라인공구 상세페이지로 이동
	// 마감O -> 마감 페이지로 이동

	@PostMapping("/offlineJoin")
	public ModelAndView offlineJoin(int off_no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		OfflineDTO dto = service.offlineSelect(off_no);	//공구(원글)정보
		
		//로그인된 아이디
		String userid = (String)request.getSession().getAttribute("logId");

		//참가자들 리스트
		List<OfflineParticipantDTO> list=service.participantList(off_no);
		OfflineParticipantDTO opDTO = new OfflineParticipantDTO();

		//userid를 이용해 참가하는 회원의 정보를 준비하기
		RegisterDTO rDTO = service.getParticipant(userid);
		opDTO.setOff_no(off_no);
		opDTO.setUserid(userid);
		opDTO.setUsername(rDTO.getUsername());
		opDTO.setTel(rDTO.getTelAst());
		System.out.println("opDTO->"+opDTO.toString());
		
		List<String> idList = service.getIds(off_no);
		if(idList.contains(userid)) {//이미 참여한 사람이면 따로 등록 X

			System.out.println("이미 등록된 회원");

		}else { //등록되어있지 않은 사람인 경우
			//DB의 offline_participant테이블에 insert한다
			service.participantInsert(opDTO);
			service.currentNumUpdate(off_no);//현재인원수 업데이트
			
		}
		dto.setCurrent_num(service.currentNumCount(off_no));
		System.out.println(off_no+"번 공동구매 참여인원 : "+dto.getCurrent_num()+"명");
		
		//정원이 가득차면 문자 보내주기+마감하기
		if(dto.getStatus()==1) {
			if(dto.getCurrent_num() >= dto.getGroup_num()) {
			//참여자별로 문자보내기
			List<OfflineParticipantDTO> opList = service.participantList(off_no);
			for(OfflineParticipantDTO participant : opList) {
				//하이픈(-)없는 전화번호 가져오기
				RegisterDTO registerDTO = service.getParticipant(participant.getUserid());				
				String tel = registerDTO.getNHTel();
				String username = participant.getUsername();
				//보낼메세지
				String content = "[t09ether]"+username+"님, 공동구매 모집이 완료되었습니다. 공구정보를 확인해주세요!";		
				//super.send_msg(tel, username, content);
			}
			service.offlineClose(off_no); // status 2로 바꾸기
			}
		}
		
		RegisterDTO firstDTO = service.getParticipant(dto.getUserid());//방장의 정보
		//뷰페이지로 정보 전송		
		mav.addObject("firstDTO", firstDTO);//방장정보 RegisterDTO
		mav.addObject("list", list);// 공구참여자정보 List<OfflineParticipantDTO>
		mav.addObject("dto", dto); //원글정보 OfflineDTO
		mav.setViewName("/offline/offlineDetail");
		
		return mav;
	}
	
	
	
	//오프라인공구마감(방장이 마감하기 클릭)
	@GetMapping("/offlineClose")
	public ModelAndView offlineClose(int off_no) {
		ModelAndView mav = new ModelAndView();
		OfflineDTO dto = service.offlineSelect(off_no);
		List<OfflineParticipantDTO> list=service.participantList(off_no);
		
		service.offlineClose(off_no);//status변경(마감)
		mav.addObject("list", list);
		mav.addObject("dto", dto);
		mav.setViewName("/offline/offlineClose");
		return mav;
	}
	
	//마감된공구 - 리뷰쓰러가기 클릭 => 마감페이지로 이동
	@GetMapping("/offlineFinished")
	public ResponseEntity<String> offlineFinished(int off_no, HttpServletRequest request) {
		
		//참여자 아닌 사람은 못들어가게
		OfflineDTO dto = service.offlineSelect(off_no);
		List<OfflineParticipantDTO> list=service.participantList(off_no);
		
		String userid = (String)request.getSession().getAttribute("logId");
		
		List<String> partyIds = service.getIds(off_no);//공구참여자 아이디목록
		
		String htmlTag="<script>";
		if(partyIds.contains(userid)) {//참여자가 맞으면 리뷰작성할 수 있는 페이지(마감된공구)로 이동
			htmlTag += "location.href='offlineClose?off_no="+off_no+"'";
		}else{//참여자 아닌경우 뒤로 돌려보내		
			htmlTag += "alert('해당 공동구매 참여자가 아닙니다.');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";
		//결과
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		

		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);	
	}

	//일정조율페이지로 넘어가기(댓글)
	@GetMapping("/offlineComment")
	public ModelAndView offlineComment(int off_no) {
		ModelAndView mav = new ModelAndView();
		OfflineDTO dto = service.offlineSelect(off_no);	
		List<OfflineParticipantDTO> list=service.participantList(off_no);
		
		mav.addObject("dto", dto);//원글정보
		mav.addObject("list", list);
		mav.setViewName("/offline/offlineComment");
		return mav;
	}

	//========================= 리뷰 시작 ========================//
	//참가자리뷰페이지 넘어가기(
	//참여자 한명에 대한 리뷰버튼 클릭 => 해당 참여자에 대한 리뷰 등록할 수 있는 글쓰기 폼으로 이동	
	@PostMapping("/offlineReview")
	public ModelAndView offlineReview(String target_id, int off_no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		// target_id : 리뷰당하는(?) 사람의 아이디(DB-칭찬대상)
		// writer : 리뷰작성하는 사람의 아이디
		String writer = (String)request.getSession().getAttribute("logId");
		System.out.println("칭찬대상->"+target_id);
		System.out.println("리뷰작성자->"+writer);
		System.out.println("userid="+target_id);
		
		mav.addObject("off_no", off_no);
		mav.addObject("target_id", target_id);
		mav.addObject("writer", writer);
		mav.setViewName("/offline/offlineReviewWrite");
		
		return mav;
		}
	

	//리뷰등록
	@PostMapping("/offlineReviewInsertOk")
	public ResponseEntity<String> offlineReviewInsertOk(OfflineReviewDTO dto, String target_id, HttpServletRequest request){
		dto.setUserid((String)request.getSession().getAttribute("logId"));//작성자아이디
		dto.setTarget_id(target_id);
		//리뷰등록 -> 실패하면 예외발생
		String htmlTag = "<script>";
		try {
			int result = reviewService.offlineReviewInsert(dto);
			htmlTag += "location.href='offline';";
		}catch(Exception e) {
			e.printStackTrace();
			htmlTag += "alert('신고가 등록되지않았습니다.');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";
		//결과
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		System.out.println("리뷰 등록 성공....");
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);		
	}
	
	
	//공구 상세정보페이지 참여자 리뷰 보기 클릭 -> 리뷰보여주는 게시판(offlineInfo.jsp)으로 이동
	@RequestMapping(value="/offlineInfo",method = RequestMethod.GET )
	public ModelAndView offlineInfo(String userid){
		ModelAndView mav = new ModelAndView();
		
		//registerinfo테이블에서 userid 에 해당하는 dto를 가져온다
		RegisterDTO dto = service.getParticipant(userid);
				
		//off_review 테이블에서 userid 에 해당하는 댓글들(dto)을 list로 담는다
		List<OfflineReviewDTO> list = reviewService.reviewSelect(userid);
		
		//해당회원이 받은 리뷰 수 
		int reviewCount = reviewService.reviewCount(userid);
		
		
		System.out.println("대상정보="+dto.toString());
		System.out.println("리뷰목록->"+list.toString());
		System.out.println("리뷰수="+reviewCount);
		
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.addObject("reviewCount", reviewCount);
		mav.setViewName("/offline/offlineInfo");
		return mav;
	}
	
	//=========================== 리뷰 끝========================//
	
	
	//******************* 댓글 시작 ******************//	
	//댓글목록보여주기
	@ResponseBody
	@GetMapping("/commentList")
	public List<OfflineCommentDTO> commentList(int off_no){
		List<OfflineCommentDTO> list = commentService.commentListSelect(off_no);
		
		return list;
	}
	
	//댓글등록하기
	@PostMapping("/commentSend")
	public String commentSend(OfflineCommentDTO dto, HttpServletRequest request) {
		dto.setUserid((String)request.getSession().getAttribute("logId"));
		System.out.println(dto.toString());
		int result=commentService.commentInsert(dto);
		return result+"";
	}
	
	
	//댓글수정하기
	@PostMapping("/commentEdit")
	public String commentEdit(OfflineCommentDTO dto, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
		int result = commentService.commentUpdate(dto);
		return String.valueOf(result);
	}
	//댓글삭제하기
	@GetMapping("/commentDelete")
	public String commentDelete(int comment_no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		return String.valueOf(commentService.commentDelete(comment_no, userid));
	}
	
	//******************* 댓글 끝 ******************//	
	
	
	//문자 전송 메소드 -> 필요한 곳에서 호출
	//공구번호(off_no)에 해당하는 참여자들에게 전송
	public void sendOffMessage(int off_no) {
		//send_msg(String tel, String username, String content)
		
		//참여자정보
		List<OfflineParticipantDTO> opList = service.participantList(off_no);
		//참여자별로 문자보내기
		for(OfflineParticipantDTO opDTO : opList) {
			String tel = opDTO.getTel();
			String username = opDTO.getUsername();
			//보낼메세지
		String content = "[t09ether]"+username+"님, 참여하신 공동구매가 내일 진행됩니다. 즐거운시간 보내시기를 t09ether가 항상 응원합니다!";		
		super.send_msg(tel, username, content);
		}
	}
	
	//문자전송 테스트
	@PostMapping("/offlineMessage")
	public ResponseEntity<String> offlineMessage(int off_no){
		//send_msg(String tel, String username, String content)
		//문자전송 -> 실패하면 예외발생
		//참여자정보
		List<OfflineParticipantDTO> opList = service.participantList(off_no);
		
		String htmlTag = "<script>";
		try {
			//참여자별로 문자보내기
			for(OfflineParticipantDTO opDTO : opList) {
				//하이픈(-)없는 전화번호 가져오기
				RegisterDTO rDTO = service.getParticipant(opDTO.getUserid());				
				String tel = rDTO.getNHTel();
				String username = opDTO.getUsername();
				//보낼메세지
				String content = "[t09ether]"+username+"님, 참여하신 공동구매가 내일 진행됩니다. 즐거운시간 보내시기를 t09ether가 항상 응원합니다!";		
				super.send_msg(tel, username, content);
			}
			htmlTag += "alert('문자 전송 성공!);";			
			htmlTag += "history.go(0);";
			;
		}catch(Exception e) {
			e.printStackTrace();
			htmlTag += "alert('문자 전송 실패...');";
			htmlTag += "history.go(0);";
		}
		htmlTag += "</script>";
		
		//결과
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);		
	}
	
}
