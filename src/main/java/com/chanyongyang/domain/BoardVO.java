package com.chanyongyang.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ycy
 * @since 23/04/12
 * 게시판 vo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("board")
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private int category;
	private String company;
	private String addr;
	private String email;
	private String id;
	private int adminGrant;
	private String name;
	private String phone;
	
	private List<AttachVO> attachs;

}
