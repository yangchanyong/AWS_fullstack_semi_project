package com.chanyongyang.mapper;

import java.util.List;

import com.chanyongyang.domain.AttachVO;



public interface AttachMapper {
	
	// 추가
	void insertReviewAttach(AttachVO vo);
	
	/**
	 * @author ycy
	 * @since 23/04/17
	 * @param vo
	 */
	void insertBoardAttach(AttachVO vo);
	
	// 삭제
	void delete(String uuid);
	
	// 해당 리뷰 번호의 모든 파일 삭제
    void deleteAll(Long rno);
	
	// 목록 조회 ( 게시판 )
	List<AttachVO> findBy(Long bno);
	
	// 단일 첨부 파일 조회 ( 리뷰용 )
	AttachVO findByOne(Long rno);
}
