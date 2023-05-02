package com.chanyongyang.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * @author DG
 * @date 2023. 4. 18.
 * 주문내역을 위한 VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("order")
public class OrderVO {
	private int orderNo;
	private int addrNo;
	private Long codeNo;
	private int cartCnt;
	private int proPrice;
	private String id;
	private int coumemberNo;
	private int payNo;
	private Date regDate;
	
	private String proName;
	private int totalPrice;
	private int orderNoCnt;
	private int couPrice;
	
	List<OrderVO> orders;
	

	public OrderVO(int addrNo, Long codeNo, int cartCnt, int proPrice, String id, int payNo, String proName, int totalPrice) {
		super();
		this.addrNo = addrNo;
		this.codeNo = codeNo;
		this.cartCnt = cartCnt;
		this.proPrice = proPrice;
		this.id = id;
		this.payNo = payNo;
		this.proName = proName;
		this.totalPrice = totalPrice;
	}
	
	
}
