package com.chanyongyang.service;

import java.util.List;

import com.chanyongyang.domain.AddressVO;

/**
 * @author 이지윤
 */
public interface AddressService {
	
	/**
	 * @param AddressVO
	 * 배송지 등록
	 */
	void register(AddressVO vo);
	
	/**
	 * @param addrNo
	 * @return AddressVO
	 * 
	 * 배송지 단일 조회
	 */
	AddressVO get(Long addrNo);
	
	/**
	 * @param id
	 * @return List<AddressVO>
	 * 
	 * id에 해당하는 배송지 리스트 조회
	 */
	List<AddressVO> getList(String id);
	
	/**
	 * @param addrNo
	 * 
	 * 배송지 단일 수정
	 */
	int modify(AddressVO vo);
	
	/**
	 * @param addrNo
	 * 
	 * 배송지 단일 삭제
	 */
	boolean remove(Long addrNo);
	
	/**
	 * @param id
	 * 
	 * 배송지 개수
	 */
	int count(String id);
	
	void deleteData(String id);
	
}
