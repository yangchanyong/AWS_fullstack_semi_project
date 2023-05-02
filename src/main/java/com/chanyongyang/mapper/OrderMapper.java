package com.chanyongyang.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.OrderVO;

/**
 * @author DG
 * @date 2023. 4. 18.
 * 주문내역
 */
public interface OrderMapper {
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param vo
	 * @param id
	 * 주문 추가
	 * , @Param("cartBuy")int cartBuy, @Param("cartCnt")int cartCnt
	 */
	void insert(@Param("cart")CartVO cart, @Param("id")String id, @Param("payNo")int payNo, @Param("addrNo")int addrNo, @Param("coumemberNo")int coumemberNo);
	
	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param orderNo
	 * @param id
	 * @return
	 * 주문 내역 단일 조회
	 */
	List<OrderVO> get(@Param("payNo") int payNo, @Param("id")String id);
	
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
	 * @param codeNo
	 * @return
	 * 주문 목록 불러옴(상품 코드 번호)
	 */
	List<OrderVO> getList(Long codeNo);
	

	/**
	 * @author DG
	 * @date 2023. 4. 18.
	 * @param id
	 * @param orderNo
	 * 주문내역 삭제
	 */
	void delete(@Param("payNo") int payNo, @Param("id")String id);
	
	/**
	 * @author ycy
	 * @date 2023. 4. 21.
	 * @param id
	 * 탈퇴한 회원의 주문내역을 지우기 위한 메서드
	 */
	void deleteData(String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 21.
	 * @param payNo
	 * @param id
	 * @return
	 * 결제 내역을 자세히 보기 위한 메서드
	 */
	List<OrderVO> getSelectOne(@Param("payNo") int payNo, @Param("id")String id);
	
}
