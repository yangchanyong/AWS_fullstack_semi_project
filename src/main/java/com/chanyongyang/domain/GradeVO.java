package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;


/**
 * 
 * @author pyj
 * 회원 등급 부여 VO
 *
 */
@Data
@Alias("grade")
public class GradeVO {
	private int gradeNo;
	private String gradeName;
	private Date regDate;
}
