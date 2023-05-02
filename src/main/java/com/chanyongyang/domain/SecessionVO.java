package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("SecessionMember")
public class SecessionVO {
	private String secessionId;
	private Date regdate;
}
