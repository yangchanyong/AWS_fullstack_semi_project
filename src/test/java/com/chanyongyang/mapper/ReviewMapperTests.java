package com.chanyongyang.mapper;

import static org.junit.Assert.assertNotNull;

import java.lang.invoke.VolatileCallSite;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {

	@Autowired
	private ReviewMapper mapper;
	@Autowired
	private MemberMapper memberMapper;
	
	
	@Autowired
	private AttachMapper attafchMapper;
	
	@Test 
	public void exists(){
		assertNotNull(mapper);
	}
	@Test
	public void insertTest(){
		ReviewVO vo = new ReviewVO();
		vo.setContent("안녕");
		vo.setWriter("테스트");
		vo.setId("id1");
		vo.setCodeNo(27L);
		mapper.insert(vo);
	}
//	@Test
//	public void selectOneTest(){
//
//		mapper.selectOne(1L);
//	}
	@Test
	public void testSelectJudgeReview(){
			mapper.selectExistsReview(24L, "id1");
	}
	@Test
	public void testGetList(){
		log.info(mapper.getListById("ycy01"));
		mapper.getListById("ycy01");
	}
	
	@Test
	public void testDeleteWithImage(){
		
		attafchMapper.deleteAll(179L);
		mapper.delete(179L);
	}
	
	@Test
	public void deleteTest(){
		if(mapper.delete(147L)){
			log.info("삭제 성공!!");
		}
	}
	@Test
	public void testUpdateData() {
		String id = "ycy01";
		log.info(mapper.getListById("ycy01"));
		mapper.updateData(id);
		log.info(mapper.getListById("ycy01"));
	}
//	@Test
//	public void testUpdateData2() {
//		String id = memberMapper.read("ycy01").getId();
//		ReviewVO vo = new ReviewVO();
//		vo.setId(id);
//		mapper.updateData(vo);
//	}
	
	@Test
	public void testGetListCodeNo(){
		mapper.getListByCodeNo(21L);
	}
}
