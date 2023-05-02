package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.CouMemberVO;

public interface CouMemberService {
	/**
	 * @author 이지윤
	 * @param id
	 * @return 
	 * 
	 * 회원이 가지고 있는 쿠폰 리스트
	 */
	List<CouMemberVO> couList(String id);
	
	/**
	 * @author 이지윤
	 * @param id
	 * 쿠폰 기본 5장으로 설정
	 */
	void defaultInsert(String id);
	
	void delete(String id);
	
	void modify(String id, int coumemberNo);
	
	CouMemberVO get(String id, int coumemberNo);
}
