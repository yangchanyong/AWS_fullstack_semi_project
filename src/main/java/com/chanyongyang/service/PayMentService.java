package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.PayMentVO;


/**
 * @author DG
 * @date 2023. 4. 18.
 * 결제 내역
 * 추가, 조회, (삭제)
 */
public interface PayMentService {
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param orderNo
	 * @param id
	 * 결제 추가
	 */
	void register(int payCode, String id, String payMethod, String cardCompany, String cardNumber, String installment);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param orderNo
	 * @param id
	 * @return
	 * 결제내역 단일조회
	 */
	PayMentVO get(int payNo, String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 20.
	 * @param payCode
	 * @param id
	 * @return
	 * payNo를 조회하기 위한 메소드
	 */
	PayMentVO getPayNo(int payCode, String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param id
	 * @return
	 * 결제내역 전체조회
	 */
	List<PayMentVO> getList(String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param id
	 * @return
	 * 결제내역(관리자용)
	 */
	List<PayMentVO> getList();
	
	void updateData(String id);

}
