package com.chanyongyang.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author pyj
 *
 * 리뷰 VO
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("review")
public class ReviewVO {
	private Long rno;
	private String content;
	private String writer;
	private String id;
	private Date regdate;
	private Long codeNo;
	
	private List<AttachVO> attachs = new ArrayList<AttachVO>();
}
