package com.t09ether.home.dao;

import com.t09ether.home.dto.ReportDTO;

public interface OfflineReportDAO {
	//신고등록(DB)
	public int offlineReportInsert(ReportDTO dto);
}
