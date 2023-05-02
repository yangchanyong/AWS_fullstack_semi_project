package com.chanyongyang.domain;

import javax.servlet.http.HttpSession;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ycy
 * @since 23/04/09, 23/04/10
 * 상품 list 필드 추가 (페이징, 상품코드 : 카테고리가 아닌 상품코드로 리스트 출력)
 * 상품별로
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	// offset 
	private int pageNum = 1;
	// limit(rownum 역할)
	private int amount = 20;
	private Integer codeMainC;
	private Integer codeMiddleC;
	private String keyword;
	private int category;
	private int adminGrant;
	
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	/**
	 * @author ycy
	 * @since 23/04/10
	 * @return
	 * 상품리스트 url에 출력될 파라미터 값
	 * 
	 */
	public String getQueryString() {
		String str = "pageNum=" + pageNum + "&" + "amount=" + amount;
		return str;
	}
	
	public int getOffset() {
		return (pageNum - 1) * amount;
	}
	
	/**
	 * @author ycy
	 * @since 23/04/10
	 * @return
	 * codeMiddleC 값이 없을 때 출력하지않는 조건식
	 */
	public String getCodeQueryString() {
		String str = "";
		if(!(codeMainC == null || codeMiddleC == null)) {
		str += "&codeMainC=" + codeMainC ; 
		str += "&codeMiddleC=" + codeMiddleC;
		
		}else if (!(codeMainC == null)) {
			str += "&codeMainC=" + codeMainC ; 

		}else {
			str = "";
		}
		return str;
	
	}
	
	/**
	 * @author ycy
	 * @since 23/04/10
	 * @return getCodeQueryString과 getQueryString을 합친 코드
	 * 
	 * @since 23/04/13
	 * keyword가 있을시 쿼리스트링에 추가
	 */
	public String getFullQueryString() {
//		String str = "pageNum=" + pageNum + "&" + "amount=" + amount + "&";
		String str = "amount=" + amount;
		str += getCodeQueryString();
		if(keyword != null) {
			str += "&keyword=" + keyword;
		}
		return str;
	}

	public String getNoticeFullQueryString() {
		amount = 10;
		category = 1;
		String str = "category=" + category;
		str += "&amount=" + amount;
		return str;
	}
	
	public String getBoardQueryString() {
		int amount = 10;
		String str = "amount=" + amount;
		str += "&category=" + category;
		return str;
	}
	
	/**
	 * @author ycy
	 * @since 23/04/10
	 * @param args
	 * Criteria 클래스 테스트
	 */
	public static void main(String[] args) {
//		Criteria cri = new Criteria(1, 24, 1, 1);
//		System.out.println(cri.getFullQueryString());
//		Criteria cri2 = new Criteria(1, 24, null, null);
//		System.out.println(cri2.getFullQueryString());
//		Criteria cri3 = new Criteria(1, 24, 3, null);
//		System.out.println(cri3.getFullQueryString());
//		Criteria cri4 = new Criteria(1, 24, null, 1);
//		System.out.println(cri4.getFullQueryString());
		
	}



	public Criteria(int pageNum, int amount, String keyword) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.keyword = keyword;
	}



	public Criteria(int pageNum, int amount, String keyword, int category) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.keyword = keyword;
		this.category = category;
	}

	
	
}
