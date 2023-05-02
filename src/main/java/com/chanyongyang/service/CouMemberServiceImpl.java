package com.chanyongyang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chanyongyang.domain.CouMemberVO;
import com.chanyongyang.mapper.CouMemberMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@ToString
@AllArgsConstructor
public class CouMemberServiceImpl implements CouMemberService{
	private CouMemberMapper couMemberMapper;
	
	@Override
	public List<CouMemberVO> couList(String id) {
		return couMemberMapper.couList(id);
	}

	@Override
	public void defaultInsert(String id) {
		couMemberMapper.defaultInsert(id);
	}

	@Override
	public void delete(String id) {
		couMemberMapper.deleteData(id);
	}

	@Override
	public void modify(String id, int coumemberNo) {
		if(coumemberNo!=0){
			couMemberMapper.updateCouCnt(id, coumemberNo);
		}
	}

	@Override
	public CouMemberVO get(String id, int coumemberNo) {
		return couMemberMapper.get(id, coumemberNo);
	}
}
