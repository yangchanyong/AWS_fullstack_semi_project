package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * 
 * @author pyj
 * 
 * 쿠폰 등록, 수정, 삭제
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("coupon")
public class CouponVO {

	private Long couNo;
	private String couName;
	private int couPrice;
	private Long couCnt;
	private Date regDate;
}
