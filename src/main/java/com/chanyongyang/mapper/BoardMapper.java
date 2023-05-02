package com.chanyongyang.mapper;

import java.util.List;

import com.chanyongyang.domain.BoardVO;
import com.chanyongyang.domain.Criteria;

/**
 * @author ycy
 * @since 23/04/13
 * 게시글 mapper
 *
 */
public interface BoardMapper {
	// 게시글 목록 조회
	List<BoardVO> getList(Criteria cri);
	List<BoardVO> getListWithPaging(Criteria cri);
	List<BoardVO> getListId(String id);
	
	// 글 등록
	void insert(BoardVO vo);
	void insertSelectKey(BoardVO vo);
	
	// 게시글 조회
	BoardVO read(Long bno);
	
	// 게시글 삭제
	int delete(Long bno);
	int deleteData(String id);
	
	// 게시글 수정
	int update(BoardVO vo);
	
	// 글 갯수
	int getTotalCnt(Criteria cri);
	
}
