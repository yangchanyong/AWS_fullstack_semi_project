package com.chanyongyang.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;


/**
 * 
 * @author pyj
 * AttachVO 필드 선언
 *
 */
@Data
@Alias("attach")
@ToString(callSuper=true)
public class AttachVO extends AttachFileDTO{
	private Long bno;
	private Long rno;
}
