package com.chanyongyang.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("member")
/**
 * 
 * @author 이지윤
 * 회원에 대한 정보
 * 
 * id, pw, name, email, regDate, phone, grantNo, gradeNo
 *
 */
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private Date regDate;
	private String phone;
	private Long grantNo;
	private Long gradeNo;
	private int adminGrant;
	private String gradeName;
}
