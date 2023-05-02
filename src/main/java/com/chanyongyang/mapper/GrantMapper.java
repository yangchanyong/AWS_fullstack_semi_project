package com.chanyongyang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chanyongyang.domain.GradeVO;
import com.chanyongyang.domain.GrantVO;
import com.chanyongyang.domain.MemberVO;

public interface GrantMapper {
	
	
	// 회원 등급 부여
	void update(@Param("grantNo") int grantNo, @Param("gradeNo") int gradeNo, @Param("id") String id);

	
}
