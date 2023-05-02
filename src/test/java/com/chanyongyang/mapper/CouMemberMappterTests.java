package com.chanyongyang.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CouMemberMappterTests {
	@Autowired
	private CouMemberMapper couMemberMapper;
	
	@Test
	public void testExist(){
		assertNotNull(couMemberMapper);
	}
	
	@Test
	public void testCouList(){
		couMemberMapper.couList("id1113").forEach(log::warn);
	}
	
	@Test
	public void testDefaultInsert(){
		String id = "id1112";
		couMemberMapper.defaultInsert(id);
	}
	
}
