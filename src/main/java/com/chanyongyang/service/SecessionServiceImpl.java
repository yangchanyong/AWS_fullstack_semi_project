package com.chanyongyang.service;

import org.springframework.stereotype.Service;

import com.chanyongyang.mapper.MemberMapper;
import com.chanyongyang.mapper.SecessionMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Service
@ToString
@AllArgsConstructor
public class SecessionServiceImpl implements SecessionService{
	private SecessionMapper secessionMapper;
	private MemberMapper memberMapper;

	@Override
	public void update(String id) {
		secessionMapper.insert(memberMapper.read(id).getId());
	}
	

}
