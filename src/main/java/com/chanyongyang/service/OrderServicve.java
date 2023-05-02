package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.OrderVO;

/**
 * @author DG
 * @date 2023. 4. 18.
 * 주문 내역
 * 추가, 조회, 삭제
 */
public interface OrderServicve {
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param ovo
	 * 주문내역 추가
	 */
	void register(Long codeNo, String id, int payNo, int addrNo, int coumemberNo, int cartBuy, int cartCnt);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param id
	 * @return
	 * 주문내역 단일조회(삭제 시)
	 */
	List<OrderVO> get(int payNo, String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param id
	 * @return
	 * 주문내역 전체 조회
	 */
	List<OrderVO> getList(String id);
	
	/**
	 * @author pyj
	 * @date 2023. 4. 18.
	 * @param id
	 * @return
	 * 주문내역 전체 조회(상품 코드 번호)
	 */
	List<OrderVO> getListByCodeNo(Long codeNo);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param id
	 * @param orderNo
	 * 주문내역 삭제
	 */
	void remove(int payNo, String id);
	
	/**
	 * @author ycy
	 * @date 2023. 4. 21.
	 * @param id
	 * 탈퇴한 회원의 주문내역 삭제
	 */
	void remove(String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 21.
	 * @param payNo
	 * @param id
	 * @return
	 * 주문 내역 조회
	 */
	List<OrderVO> getSelectOne(int payNo, String id);
}
