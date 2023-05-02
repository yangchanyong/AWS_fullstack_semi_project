package com.chanyongyang.service;

import org.springframework.stereotype.Service;

import com.chanyongyang.mapper.GrantMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{

	private GrantMapper mapper;
	
	@Override
	public void modify(int grantNo, int gradeNo, String id) {
		
		mapper.update(grantNo, gradeNo, id);
	}

	
	
}
