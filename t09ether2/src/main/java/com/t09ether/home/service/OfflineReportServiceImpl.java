package com.t09ether.home.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t09ether.home.dao.OfflineReportDAO;
import com.t09ether.home.dto.ReportDTO;
@Service
public class OfflineReportServiceImpl implements OfflineReportService {
	@Autowired
	OfflineReportDAO dao;
	@Override
	public int offlineReportInsert(ReportDTO dto) {
		return dao.offlineReportInsert(dto);
	}

}
