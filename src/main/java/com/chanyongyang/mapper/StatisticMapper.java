package com.chanyongyang.mapper;

import java.util.Date;

import com.chanyongyang.domain.ProductVO;
import com.chanyongyang.domain.StatisticVO;


public interface StatisticMapper {

	// 원가, 매출액, 영업이익 조회
	StatisticVO getSalesMonthRecord();
	
	StatisticVO getSalesDayRecord(String date);
	
	
	
}
