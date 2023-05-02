package com.chanyongyang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.PayMentVO;
import com.chanyongyang.domain.ReviewVO;



/**
 * @author DG
 * @date 2023. 4. 18.
 * 결제내역
 * 추가, 조회, (삭제)
 */
public interface PayMentMapper {
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param orderNo
	 * @param id
	 * 결제 추가
	 */
	void insert(@Param("payCode") int payCode, @Param("id")String id, @Param("payMethod")String payMethod, @Param("cardCompany")String cardCompany, @Param("cardNumber")String cardNumber, @Param("installment")String installment);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param orderNo
	 * @param id
	 * @return
	 * 결제내역 단일조회
	 */
	PayMentVO get(@Param("payNo") int payNo, @Param("id")String id);
	
	
	/**
	 * @author DG
	 * @date 2023. 4. 20.
	 * @param payCode
	 * @param id
	 * @return
	 * PayNo를 조회(order에 넣기 위함)
	 */
	PayMentVO getPayNo(@Param("payCode")int payCode, @Param("id")String id); 
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
	List<PayMentVO> getAList();
	
	/**
	 * @author DG
	 * @date 2023. 4. 25.
	 * @param id
	 */
	void updateData(String id);
}
