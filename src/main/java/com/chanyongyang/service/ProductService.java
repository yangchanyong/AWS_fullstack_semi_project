package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.ProCodeVO;
import com.chanyongyang.domain.ProductVO;

/**
 * 
 * <p>ProductService 의 기능 선언</p>
 * @author 박연재
 * @category 상품 리스트
 * @category 상품 상세 조회
 * 
 */
public interface ProductService {

	// 상품 추가
//	public void register(ProductVO product);
	
	/**
	 * 
	 * <p>상품 리스트 조회<p>
	 * @author pyj
	 * @param cri
	 * @since 23/04/12
	 * @return 상품 리스트
	 * 
	 */
	List<ProductVO> getList(Criteria cri);
	
	
	/**
	 * @author ycy
	 * @param cri
	 * @since 23/04/12
	 * 신상품 출력을 위한 메서드 생성
	 */
	List<ProductVO> getNewProduct(Criteria cri);

	/**
	 * @param cri
	 * @since 23/04/12
	 * paging을 위한 메서드 생성
	 */
	int getTotalCnt(Criteria cri);
	
	/**
	 * 
	 * <p>상품 상세 조회</p>
	 * @param codeNo
	 * @since 2023/04/12
	 * @return 상품
	 */
	ProductVO get(Long codeNo);
	
	
	/**
	 * <p>연관 상품 조회</p>
	 * @param vo
	 * @since 2023/04/12
	 * @return 
	 */
	List<ProductVO> getCareProduct(ProCodeVO vo);
	
	
	/**
	 * <p>카테고리 조회용 ( ProcodeVO )</p>
	 * @param codeNo
	 * @return 카테고리 조회
	 */
	ProCodeVO findBy(Long codeNo);
	

	/**
	 * @author DG
	 * @date 2023. 4. 20.
	 * @param proCnt
	 * @param codeNo
	 * 결제 후 상품 재고를 수정하기 위한 메서드
	 */
	void modifyProCnt(int proCnt, int codeNo);
	
	
}
