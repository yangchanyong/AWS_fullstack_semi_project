package com.chanyongyang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.ProductVO;

/**
 * @author DG
 * @date 0411
 * 장바구니Mapper 인터페이스
 *
 */
public interface CartMapper {

	/**
	 * @author DG
	 * @param vo
	 * @date 0411
	 * 장바구니 추가
	 */
	void insert(CartVO cvo);
	

	/**
	 * @author DG
	 * @date 0411
	 * @param vo
	 * @return
	 * 회원의 장바구니 목록 조회
	 */
	List<CartVO> getList(MemberVO vo);
	
	//장바구니 조회
	

	/**
	 * @author DG
	 * @date 0411
	 * @param cvo
	 * 회원 장바구니의 물품 수량 수정
	 * 
	 */
	void update(@Param("cartCnt") int cartCnt, @Param("codeNo") Long codeNo, @Param("id")String id);
	

	/**
	 * @author DG
	 * @date 0411
	 * @param cvo
	 * 회원의 장바구니에서 물품 삭제
	 */
	void delete(@Param("codeNo") Long codeNo, @Param("id")String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 12.
	 * @param codeNo
	 * @param mvo (member)
	 * @return
	 * 회원의 상품 단일 조회
	 */
	CartVO getSelectOne(@Param("codeNo")Long codeNo, @Param("id")String id);
	
	/**
	 * @author DG
	 * @date 2023. 4. 25.
	 * @param id
	 * 장바구니에서 구매한 물품에 대한 결제 후 장바구니 비우기 메서드
	 */
	void deleteAll(String id);
	
	/**
	 * @author ycy
	 * @date 2023. 4. 21.
	 * @param id
	 * 탈퇴하려는 회원의 장바구니 비우기
	 */
	void deleteData(String id);
}
