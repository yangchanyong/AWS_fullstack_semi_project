package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.BoardVO;
import com.chanyongyang.domain.Criteria;

public interface BoardService {
	
	// 글 작성
	void register(BoardVO vo);
	
	// 글 보기
	BoardVO get(Long bno);
	
	// 게시글 리스트
	List<BoardVO> getList(Criteria cri);
	
	List<BoardVO> getListId(String id);
	
	// 글 수정
	boolean modify(BoardVO vo);
	
	// 글 삭제
	boolean remove(Long bno);
	
	boolean remove(String id);
	// 페이징처리
	int getTotalCnt(Criteria cri);
	
}
