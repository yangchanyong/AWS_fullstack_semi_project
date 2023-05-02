package com.chanyongyang.mapper;

import java.util.List;

import com.chanyongyang.domain.MemberVO;

/**
 * @author 이지윤
 */

public interface MemberMapper {
	
	/**
	 * @param MemberVo
	 * 
	 * 회원 가입
	 */
	void insert(MemberVO vo);
	
	/**
	 * @param id
	 * @return MemberVO
	 * 
	 * 회원 단일 조회
	 */
	MemberVO read(String id);
	
	/**
	 * @return List<MemberVO>
	 * 
	 * 회원 리스트 조회
	 */
	List<MemberVO> getList();
	
	/**
	 * @param MemberVO
	 * 
	 * 회원 정보 수정
	 */
	int update(MemberVO vo);
	

	/**
	 * @author ycy
	 * @param vo
	 * @return 비밀번호 변경
	 */
	int updatePw(MemberVO vo);

	/**
	 * @param id
	 * 
	 * 회원 탈퇴
	 */
	int delete(String id);
}
