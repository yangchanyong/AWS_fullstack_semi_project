package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("address")
public class AddressVO {
	private Long addrNo;
	private String addr;
	private String addrDetail;
	private String id;
	private String recipient;
	private String memo;
	private Date regDate;
	private String addrName;
	private String phone;
}
