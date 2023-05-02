package com.chanyongyang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.ReviewVO;

/**
 * 
 * @author pyj
 * 리뷰 관련 기능
 *
 */
public interface ReviewMapper {
	
	List<ReviewVO> getListByCodeNo(Long codeNo);
	
	// 모든 리뷰 목록 조회 ( 상품 내의 모든 회원들의 리뷰 조회 ) => 마이페이지
	List<ReviewVO> getListById(String id);
	
	// 단일 상품 리뷰 조회 ( 마이페이지 리뷰 조회 )
	ReviewVO selectOneByRno(Long rno);
	
	// 단일 상품 리뷰 조회 ( 마이페이지 리뷰 조회 )
	ReviewVO selectOne(@Param("codeNo") Long codeNo,@Param("id") String id);
	
	// 단일 상품 리뷰 조회 ( 마이페이지 리뷰 조회 )
	int selectExistsReview(@Param("codeNo") Long codeNo,@Param("id") String id);
	
	// 단일 상품 리뷰 조회 ( 마이페이지 리뷰 조회 )
	ReviewVO findBy(Long codeNo, String id);
	
	// 상품 리뷰 추가
	void insert(ReviewVO vo);
	
	// 상품 리뷰 추가
	void insertSelectKey(ReviewVO vo);
	
	// 리뷰 삭제 ( 파일 삭제 선행 )
	boolean delete(Long rno);

	int getTotalReviewCnt(Long codeNo);
//	ReviewVO getPaidInfoByCodeNo(Long codeNo);
	
	/**
	 * @author ycy
	 * @since 23/04/21
	 * @param vo
	 * @return 회원 탈퇴 전 작성한 리뷰 수정
	 */
	void updateData(String id);
	
	List<ReviewVO> getListCodeNo(Long codeNo);

}
