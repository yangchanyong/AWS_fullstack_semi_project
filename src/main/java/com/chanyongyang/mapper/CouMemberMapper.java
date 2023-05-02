package com.chanyongyang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.CouMemberVO;


public interface CouMemberMapper {
	/**
	 * @author 이지윤
	 * @param id
	 * @return 회원이 보유하고있는 쿠폰 리스트
	 */
	 List<CouMemberVO> couList(String id);
	 
	 /**
	  * @author 이지윤
	  * @param id
	  * 처음 회원가입 시 브론즈 등급, 쿠폰 기본 5장 제공
	  */
	 void defaultInsert(String id);
	 
	 void deleteData(String id);
	 
	 void updateCouCnt(@Param("id")String id, @Param("coumemberNo")int coumemberNo);
	 
	 CouMemberVO get(@Param("id")String id, @Param("coumemberNo")int coumemberNo);
}
