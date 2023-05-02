package com.chanyongyang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chanyongyang.domain.CouponVO;
import com.chanyongyang.mapper.CouponMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author pyj
 * 관리자 쿠폰 등록, 삭제, 수정
 */
@Service
@AllArgsConstructor
@ToString
public class CouponServiceImpl implements CouponService{

	
	private CouponMapper couponMapper;
	
	@Override
	public List<CouponVO> getList() {
		return couponMapper.getList();
		
	}

	@Override
	public CouponVO findBy(Long couNo) {
		return couponMapper.selectOne(couNo);
	}

	@Override
	public void register(CouponVO vo) {
		couponMapper.insert(vo);
	}

	@Override
	public void modify(CouponVO vo) {
		couponMapper.update(vo);
	}

	@Override
	public void remove(Long couNo) {
		couponMapper.delete(couNo);
	}
	
	
}
