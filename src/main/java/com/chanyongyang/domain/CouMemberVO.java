package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("coumember")
public class CouMemberVO {
	private int coumemberNo;
	private String couName;
	private Long couNo;
	private String id;
	private Long couCnt;
	private Date regDate;
	private int couPrice;
}
