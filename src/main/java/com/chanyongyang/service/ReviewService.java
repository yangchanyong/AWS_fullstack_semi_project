package com.chanyongyang.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.AttachFileDTO;
import com.chanyongyang.domain.ReviewVO;

/**
 * 
 * @author pyj
 * 리뷰 서비스 인터페이스
 *
 */
public interface ReviewService {

	/**
	 * 
	 * @param id
	 * @return List<ReviewVO>
	 * 마이페이지 내에 존재하는 내 리뷰 목록 조회
	 */
	List<ReviewVO> getListBy(String id);
	
	
	/**
	* @param id
	* @return List<ReviewVO>
	* 모든 리뷰 목록 조회 ( 상품 내의 모든 회원들의 리뷰 조회 )
	*/
	List<ReviewVO> getListByCodeNo(Long codeNo);
	
	/**
	 * 
	 * @param rno
	 * @return ReviewVO
	 * 단일 상품 리뷰 조회 ( 마이페이지 리뷰 조회 )
	 */
	ReviewVO findBy(Long rno);

	/**
	 * 
	 * @param codeNo
	 * @param id
	 * @return ReviewVO
	 * 상품 코드 번호와 사용자 아이디로 리뷰 조회
	 */
	ReviewVO findBy(Long codeNo, String id);
	
	/**
	 * 
	 * @param codeNo
	 * @param id
	 * @return int
	 * 리뷰 존재 여부
	 */
	int existsReview(Long codeNo, String id);
	
	/**
	 * 
	 * @param vo
	 * 상품 리뷰 추가
	 */
	void add(ReviewVO vo);
	
	/**
	 * 
	 * @param rno
	 * @return boolean
	 * 리뷰 삭제 ( 파일 삭제 선행 )
	 */
	boolean remove(Long rno);
	
	/**
	 * 
	 * @param dto
	 * @return String
	 * 파일 업로드 직전에 파일 삭제하는 기능
	 */
	String deleteFile(AttachFileDTO dto);
	
	
	/**
	 * 
	 * @param codeNo
	 * @return int
	 * 상품의 리뷰 갯수
	 */
	int getTotalReviewCnt(Long codeNo);
	
	/**
	 * @author ycy
	 * @since 23/04/21
	 * @param vo
	 * @return 회원 탈퇴 전 작성한 리뷰 수정
	 */
	void updateData(String id);
	
	List<ReviewVO> getListCodeNo(Long codeNo);
	
}

