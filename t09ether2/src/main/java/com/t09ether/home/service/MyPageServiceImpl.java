package com.t09ether.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t09ether.home.dao.MyPageDAO;

import com.t09ether.home.dto.AdminOrderPagingVO;
import com.t09ether.home.dto.AdminPagingVO;

import com.t09ether.home.dto.AdUserPagingVO;

import com.t09ether.home.dto.MyPageDTO;
import com.t09ether.home.dto.MyPostPagingVO;
import com.t09ether.home.dto.MyPostPagingVO2;
import com.t09ether.home.dto.OffPartDTO;
import com.t09ether.home.dto.OrderDTO;
import com.t09ether.home.dto.ReportDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Inject
	MyPageDAO dao;
	
	////
	@Override
	public MyPageDTO loginOk(String userid, String userpwd) {
		return dao.loginOk(userid, userpwd);
	}

	@Override
	public MyPageDTO mpRegisterEdit(String userid) {
		return dao.mpRegisterEdit(userid);
	}

	@Override
	public MyPageDTO idChk(String userid) {
		return dao.idChk(userid);
	}

	@Override
	public int mpRegisterEditOk1(MyPageDTO dto) {
		return dao.mpRegisterEditOk1(dto);
	}

	@Override
	public int mpRegisterEditOk2(MyPageDTO dto) {
		return dao.mpRegisterEditOk2(dto);
	}
	////
	
	//온라인 공구내역 게시판 리스트 + 페이징
	@Override
	public int totalRecord(AdminPagingVO vo) {
		return dao.totalRecord(vo);
	}
	
	@Override
	public int totalOrdRecord(AdminPagingVO vo) {
		return dao.totalOrdRecord(vo);
	}
	
	@Override
	public int totalOrdSucRecord(AdminOrderPagingVO vo2) {
		return dao.totalOrdSucRecord(vo2);
	}
	
	@Override
	public List<OrderDTO> pageSelect(AdminPagingVO vo) {
		return dao.pageSelect(vo);
	}
	
	@Override
	public List<OrderDTO> pageOrdSelect(AdminPagingVO vo) {
		return dao.pageOrdSelect(vo);
	}
	
	@Override
	public List<OrderDTO> pageOrdSucSelect(AdminOrderPagingVO vo2) {
		return dao.pageOrdSucSelect(vo2);
	}	
	
	//오프라인 공구 게시판 페이징
	@Override
	public int mpTotalRecord(MyPostPagingVO vo) {
		return dao.mpTotalRecord(vo);
	}

	@Override
	public int mpTotalSucRecord(MyPostPagingVO2 vo2) {
		return dao.mpTotalSucRecord(vo2);
	}

	@Override
	public List<OffPartDTO> offPageSelect(MyPostPagingVO vo) {
		return dao.offPageSelect(vo);
	}

	@Override
	public List<OffPartDTO> offPageSucSelect(MyPostPagingVO2 vo2) {
		return dao.offPageSucSelect(vo2);
	}

	@Override
	public OffPartDTO boardSelect(int no) {
		return dao.boardSelect(no);
	}
	
	//오프라인 구성원 리스트
	@Override
	public int myOrderSucUpdate(int on_no) {
		return dao.myOrderSucUpdate(on_no);
	}

	@Override
	public int reportInsert(ReportDTO dto) {
		return dao.reportInsert(dto);
	}

	@Override
	public int reportRegisterUpdate(String target_id) {
		return dao.reportRegisterUpdate(target_id);
	}

	@Override
	public int orderStatusUpdate(int ord_no) {
		return dao.orderStatusUpdate(ord_no);
	}


	@Override
	public int expUpdate(String userid) {
		return dao.expUpdate(userid);
	}
	
	@Override
	public List<OffPartDTO> offPartList(int no) {
		return dao.offPartList(no);
	}

	@Override
	public int expSelect(String userid) {
		return dao.expSelect(userid);
	}

	@Override
	public int rankUpdate(String userid) {
		return dao.rankUpdate(userid);
	}

}
