package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.MemberVO;
/**
 * @author 이지윤
 * 회원 가입/(단일/리스트)조회/수정/탈퇴 메서드 
 *
 */

public interface MemberService {
	
	/**
	 * @param vo
	 * 회원 가입
	 */
	void register(MemberVO vo);
	
	/**
	 * @param id
	 * @return MemberVO
	 * 회원 단일 조회
	 */
	MemberVO get(String id);
	
	/**
	 * @return List<MemberVO>
	 * 회원 리스트 조회
	 */
	List<MemberVO> getList();
	
	/**
	 * @param vo
	 * 회원 정보 수정
	 */
	boolean modify(MemberVO vo);
	
	/**
	 * @param vo
	 * 비밀 번호 변경
	 */
	boolean modifyPw(MemberVO vo);
	
	/**
	 * @param vo
	 * 회원 탈퇴
	 */
	void remove(String id);
}
