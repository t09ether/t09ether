package com.t09ether.home.dao;

import java.util.List;

import com.t09ether.home.dto.OfflineDTO;
import com.t09ether.home.dto.OfflinePagingVO;
import com.t09ether.home.dto.OfflineParticipantDTO;
import com.t09ether.home.dto.RegisterDTO;

public interface OfflineDAO {
	//글등록
	public int offlineInsert(OfflineDTO dto);
	//총레코드수
	public int totalRecord(OfflinePagingVO vo);
	//해당페이지 선택하기
	public List<OfflineDTO> offList(OfflinePagingVO vo);
	//공구 선택(off_no)
	public OfflineDTO offlineSelect(int off_no);
	//조회수증가
	public void offlineHitCount(int off_no);
	//글선택(수정폼으로이동)
	public OfflineDTO offlineEditSelect(int off_no);
	//글수정(DB등록)
	public int offlineUpdate(OfflineDTO dto);
	//글삭제
	public int offlineDelete(OfflineDTO dto);
	//공구참여시 -> userid 를 이용해참여자의 정보(RegisterDTO)불러오기
	public RegisterDTO getParticipant(String userid);	
	// 참여자 정보를 off_participant 테이블에 추가하기
	public int participantInsert(OfflineParticipantDTO opDTO);
	// 공구번호(off_no)에 해당하는 참가자들 정보 불러오기(List)
	public List<OfflineParticipantDTO> participantList(int off_no);
	// 공구참여인원수
	public int currentNumCount(int off_no);
	// 공구참여자들의 아이디만 뽑아오기
	public List<String> getIds(int off_no);
	// 공구 마감(status 2로변경)
	public void offlineClose(int off_no);
	// 공구 인원수(current_num)업데이트
	public void currentNumUpdate(int off_no);
}
