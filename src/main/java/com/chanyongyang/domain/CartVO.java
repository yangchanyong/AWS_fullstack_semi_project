package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author DG
 * @date 0410
 * cart내용을 저장하기 위한 클래스
 * 
 * cartNo 장바구니 번호
 * proNo product의 물품의 코드
 * cartCnt 사용자가 담은 물품의 수량
 * id : member클래스의 id
 * regDate : 장바구니 저장 날짜
 * 
 * @author DG
 * @date 0411
 * proNo -> codeNo로 변경
 * 변경 사유 : proNo의 기본키가 사용시 부적합 하여 codeNo로 변경
 * 
 * @author DG
 * @date 0412
 * proName(tbl_product), proSalePrice(tbl_product) name(tbl_member)추가
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("cart")
public class CartVO {
	private Long cartNo;
	private Long codeNo;
	private int cartCnt;
	private String id;
	private Date regDate;
	private int proPrice;
	
	private String name;
	private String proName;
	private int proSalePrice;
	private int salePrice;
	private int payNo;
	private int addrNo;
	private int cartBuy=0;
	private int proCnt;
	
	/**
	 * @author DG
	 * @date 2023. 4. 15.
	 * @param codeNo
	 * @param id
	 * @param cartCnt
	 * cartVO에 담기위한 생성자 생성
	 */
	public CartVO(Long codeNo, String id, int cartCnt) {
		super();
		this.codeNo = codeNo;
		this.cartCnt = cartCnt;
		this.id = id;
	}
	
	public CartVO(Long codeNo, String id, int cartCnt, int salePrice) {
		this.codeNo = codeNo;
		this.cartCnt = cartCnt;
		this.id = id;
		this.salePrice = salePrice;
	}


	public CartVO(Long codeNo, int cartCnt, String id, int salePrice, String proName, int cartBuy) {
		this.codeNo = codeNo;
		this.cartCnt = cartCnt;
		this.id = id;
		this.salePrice = salePrice;
		this.proName = proName;
		this.cartBuy = cartBuy;
	}
	
	
}
