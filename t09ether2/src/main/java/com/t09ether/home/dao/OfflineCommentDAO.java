package com.t09ether.home.dao;

import java.util.List;

import com.t09ether.home.dto.OfflineCommentDTO;

public interface OfflineCommentDAO {
		//댓글목록
		public List<OfflineCommentDTO> commentListSelect(int off_no);
		//댓글등록
		public int commentInsert(OfflineCommentDTO dto);
		//댓글수정
		public int commentUpdate(OfflineCommentDTO dto);
		//댓글삭제
		public int commentDelete(int comment_no, String userid);
}
