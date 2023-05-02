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
public class GrantMapperTests {

	@Autowired
	private GrantMapper mapper;
	
	
//	@Autowired MemberMapper memberMapper;
	
	@Test
	public void testExist(){
		assertNotNull(mapper);
	}
	
	@Test
	public void testGrant(){
//		MemberVO vo = memberMapper.read("park");
		mapper.update(1, 3,"park");
	}
	
}
