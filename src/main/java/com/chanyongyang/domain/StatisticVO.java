package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("statistic")
public class StatisticVO {
	private int proNo;
	private char payNo;

	// 테이블 조인시에 얻을 필드값
	private OrderVO ord;
	private int income = 0;
	private int sales = 0;
	private Date regdate;
}
