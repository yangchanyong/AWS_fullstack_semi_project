package com.chanyongyang.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.PayMentVO;

import lombok.extern.log4j.Log4j;

/**
 * @author DG
 * @date 2023. 4. 19.
 * PayMentMapper를 test하기 위한 클래스
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PayMentMapperTests {
	@Autowired
	private PayMentMapper payMentMapper; 
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Test
	public void testInsert(){
		payMentMapper.insert(92345, memberMapper.read("id1").getId(),"card","신한카드","1234*****", "2");
	}
	
	@Test
	public void testGet(){
		log.info(payMentMapper.get(61, memberMapper.read("id1").getId()));
	}
	
	@Test
	public void testGetPayNO(){
		log.info(payMentMapper.getPayNo(92345, memberMapper.read("id1").getId()));
	}
	
	@Test
	public void testGetList(){
		log.info(payMentMapper.getList(memberMapper.read("ycy01").getId()));
	}
	
	@Test
	public void testGetAList(){
		log.info(payMentMapper.getAList());
	}
	
	@Test
	public void testUpdateData(){
		String id = "ycy01";
		log.info(payMentMapper.getList(id));
		payMentMapper.updateData(id);
		log.info(payMentMapper.getList(id));
	}
}
