package com.chanyongyang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.CouMemberVO;
import com.chanyongyang.domain.CouponVO;


public interface CouponMapper {
	/**
	 * @author 박연재
	 * @param CouponVO vo
	 * 관리자는 쿠폰을 조회할 수 있음
	 */
	List<CouponVO> getList();
	/**
	 * @author 박연재
	 * @param CouponVO vo
	 * 관리자는 쿠폰을 조회할 수 있음
	 */
	CouponVO selectOne(Long couNo);
	/**
	 * @author 박연재
	 * @param CouponVO vo
	 * 관리자는 쿠폰을 등록할 수 있음
	 */
	 void insert(CouponVO vo);
	 
	 /**
	  * @author 박연재
	  * @param vo
	  * 쿠폰 수정
	  */
	 void update(CouponVO vo);
	 
	 /**
	  * @author 박연재
	  * @param vo
	  * 쿠폰 삭제
	  */
	 void delete(Long couNo);
}
