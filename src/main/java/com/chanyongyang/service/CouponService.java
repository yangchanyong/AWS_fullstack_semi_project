package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.CouponVO;

/**
 * 
 * <p>관리자 쿠폰 등록, 삭제, 수정</p>
 * @author pyj
 */
public interface CouponService {
	
	/**
	 * <p>관리자는 쿠폰을 조회할 수 있음</p>
	 * @author 박연재
	 * @since 2023/04/24
	 * @param CouponVO vo
	 */
	List<CouponVO> getList();
	
	/**
	 * <p>관리자는 쿠폰을 조회할 수 있음</p>
	 * @author 박연재
	 * @since 2023/04/24
	 * @param codeNo
	 */
	CouponVO findBy(Long couNo);
	
	/**
	 * <p>관리자는 쿠폰을 등록할 수 있음<p>
	 * @author 박연재
	 * @since 2023/04/24
	 * @param CouponVO vo
	 */
	 void register(CouponVO vo);
	 
	 /**
	  * <p>쿠폰 수정</p>
	  * @author 박연재
	  * @param vo
	  * @since 2023/04/24
	  */
	 void modify(CouponVO vo);
	 
	 /**
	  * <p>쿠폰 삭제</p>
	  * @author 박연재
	  * @param codeNo
	  * @since 2023/04/24
	  */
	 void remove(Long couNo);
}
