package com.chanyongyang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.ProCodeVO;
import com.chanyongyang.domain.ProductVO;


/**
 * <p>====================================<p>
 * 			<h3>ProductMapper</h3>
 * <p>====================================</p>
 * 추가, 조회(리스트, 상세), 수정, 삭제
 *
 */
public interface ProductMapper {
	
	// 상품 리스트
	/**
	 * 
	 * @
	 * @return 상품 리스트
	 * <p>모든 상품 리스트들을 조회</p>
	 * 
	 */
	List<ProductVO> getList();
	
	/**
	 * 
	 * @param cri
	 * @return 페이징에 의한 상품 리스트 조회
	 * <p>페이지 내에 있는 모든 상품들을 조회</p>
	 */
	List<ProductVO> getListWithPaging(Criteria cri);
	
	/**
	 * 
	 * @return 상품 리스트 조회
	 * <p>신상품 리스트 조회</p>
	 */
	List<ProductVO> getNewProduct();
	
	
	/**
	 * @param cri
	 * @since 23/04/12
	 * <p>paging을 위한 메서드 생성</p>
	 */
	int getTotalCnt(Criteria cri);
	


	/**
	 * 
	 * @param codeNo
	 * @return 상품 단일 조회
	 * <p>상품 코드 번호로 상품 단일 조회</p>
	 */
	ProductVO get(Long codeNo);
	
	
	
	/**
	 * 
	 * @param code
	 * @return 상품 리스트
	 * <p>연관 상품 리스트를 조회 (1~20개)</p> 
	 */
	List<ProductVO> getCareProductList(ProCodeVO code);
	
	/**
	 * 
	 * @param code
	 * @return 상품
	 * 상품 코드 번호로 Procode를 조회
	 */
	ProCodeVO read(Long code);
	
	/**
	 * 
	 * @param codeNo
	 * @param id
	 * 상품 코드 번호, 아이디에 의한 상품 갯수 수정
	 * 
	 */
	void updateDecreasedProCnt(@Param("codeNo") Long codeNo,@Param("id") String id);
	
	/**
	 * 
	 * @param codeNo
	 * @param id
	 * 상품 코드 번호, 아이디에 의한 상품 갯수 수정
	 * 
	 */
	void updateProCnt(@Param("proCnt")int proCnt, @Param("codeNo")int codeNo);
}
