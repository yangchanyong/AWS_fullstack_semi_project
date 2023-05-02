package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("grant")
public class GrantVO {
	private int grantNo;
	private char adminGrant;
	private Date updatedate;
	private Date regDate;
}
