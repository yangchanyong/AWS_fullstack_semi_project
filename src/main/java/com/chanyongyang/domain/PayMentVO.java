package com.chanyongyang.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author DG
 * @date 2023. 4. 18.
 * 결제 정보를 가지고 있는 VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("payment")
public class PayMentVO {
	private int payNo;
	private int payCode;
	private String payMethod;
	private String cardCompany;
	private String cardNumber;
	private String payBank;
	private String payNumber;
	private String id;
	private String installment;
	private Date regDate;
	
	
	private int cartCnt;
	private OrderVO ord;
	private ProductVO tpro;
}
