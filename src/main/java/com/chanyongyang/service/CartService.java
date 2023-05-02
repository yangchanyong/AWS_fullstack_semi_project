package com.chanyongyang.service;

import java.lang.reflect.Member;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.ProductVO;

/**
 * @author DG
 * @date 2023. 4. 13.
 * 장바구니 Service Interface
 */
public interface CartService {
	
	/**
	 * @author DG
	 * @param cvo
	 * @date 2023. 4. 13. 
	 * 장바구니 추가
	 */
	void register(CartVO cvo);
	

	/**
	 * @author DG
	 * @date 2023. 4. 13.
	 * @param vo
	 * @return
	 * 회원의 장바구니 목록 조회
	 */
	List<CartVO> getList(MemberVO vo);
	
	//장바구니 조회
	

	/**
	 * @author DG
	 * @date 2023. 4. 13. 
	 * @param cvo
	 * 회원 장바구니의 물품 수량 수정
	 * 
	 */
	void modify(int cartCnt, Long codeNo, String id);
	

	/**
	 * @author DG
	 * @date 2023. 4. 13. 
	 * @param cvo
	 * 회원의 장바구니에서 물품 삭제
	 */
	void remove(Long codeNo, String id);

	/**
	 * @author ycy
	 * @date 2023. 4. 21.
	 * @param id
	 * 탈퇴한 회원의 장바구니 삭제
	 */
	void remove(String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 13.
	 * @param codeNo
	 * @param mvo (member)
	 * @return
	 * 회원의 상품 단일 조회
	 */
	CartVO getSelectOne(Long codeNo, String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 25.
	 * @param id
	 * 장바구니에서 결제한 물품일 경우 결제한 뒤 장바구니 비우는 메서드
	 */
	void removeAll(String id);
	
}
