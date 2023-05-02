package com.chanyongyang.mapper;

import java.util.List;

import com.chanyongyang.domain.AddressVO;

/**
 * @author 이지윤
 */
public interface AddressMapper {
	/**
	 * @param AddressVO
	 * 
	 * 주소 등록
	 */
	void insert(AddressVO vo);
	
	/**
	 * @param addrNo
	 * @return AddressVO
	 * 
	 * 주소 단일 조회
	 */
	AddressVO read(Long addrNo);
	
	/**
	 * @return List<AddressVO>
	 * 
	 * 주소 리스트 조회
	 */
	List<AddressVO> getList(String id);
	
	/**
	 * @param vo
	 * 
	 * 주소 변경
	 */
	int update(AddressVO vo);
	
	/**
	 * @param addrNo
	 * 
	 * 주소 삭제
	 */
	int delete(Long addrNo);
	
	/**
	 * @param id
	 * 
	 * 등록된 주소 개수
	 */
	int count(String id);
	
	/**
	 * @param id
	 * 데이터 삭제
	 */
	void deleteData(String id);
}
