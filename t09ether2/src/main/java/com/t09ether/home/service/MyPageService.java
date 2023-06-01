package com.t09ether.home.service;

import java.util.List;

import com.t09ether.home.dto.AdminOrderPagingVO;
import com.t09ether.home.dto.AdminPagingVO;

import com.t09ether.home.dto.AdUserPagingVO;

import com.t09ether.home.dto.MyPageDTO;
import com.t09ether.home.dto.MyPostPagingVO;
import com.t09ether.home.dto.MyPostPagingVO2;
import com.t09ether.home.dto.OffPartDTO;
import com.t09ether.home.dto.OrderDTO;
import com.t09ether.home.dto.ReportDTO;

public interface MyPageService {
	public MyPageDTO loginOk(String userid, String userpwd);
	public MyPageDTO mpRegisterEdit(String userid);
	public MyPageDTO idChk(String userid);
	public int mpRegisterEditOk1(MyPageDTO dto);
	public int mpRegisterEditOk2(MyPageDTO dto);
	
	//온라인 공구내역 게시판 리스트 + 페이징
	public int totalRecord(AdminPagingVO vo);
	public int totalOrdRecord(AdminPagingVO vo);
	public int totalOrdSucRecord(AdminOrderPagingVO vo2);
	public List<OrderDTO> pageSelect(AdminPagingVO vo);
	
	
	public List<OrderDTO> pageOrdSelect(AdminPagingVO vo);
	public List<OrderDTO> pageOrdSucSelect(AdminOrderPagingVO vo2);
	
	public int myOrderSucUpdate(int on_no);
	public int expUpdate(String userid);
	public int reportInsert(ReportDTO dto);
	public int reportRegisterUpdate(String target_id);
	
	public int orderStatusUpdate(int ord_no);
	

	public int expSelect(String userid);
	public int rankUpdate(String userid);
	

	//오프라인 공구 게시판 페이징
	public int mpTotalRecord(MyPostPagingVO vo);
	public int mpTotalSucRecord(MyPostPagingVO2 vo2);
	
	public List<OffPartDTO> offPageSelect(MyPostPagingVO vo);
	public List<OffPartDTO> offPageSucSelect(MyPostPagingVO2 vo2);
	
	public OffPartDTO boardSelect(int no);
	
	//오프라인 구성원 리스트
	public List<OffPartDTO> offPartList(int no);
}

