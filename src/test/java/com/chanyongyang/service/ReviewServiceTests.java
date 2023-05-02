package com.chanyongyang.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.ProductVO;
import com.chanyongyang.domain.ReviewVO;
import com.chanyongyang.mapper.ProductMapper;
import com.chanyongyang.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

/**
 * 
 * @author 박연재
 * ProductService 테스트 (추가, 조회, 수정, 삭제)
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTests {
	
	@Autowired
	private ReviewService service;
	
	
	
	@Test
	public void testGet(){
		ReviewVO vo = service.findBy(3L);
		log.info(vo);
		
	}

	
	
	@Test
	public void testGetList(){
		
		// 두 방식 다 사용 가능
		service.getListBy("id1").forEach(log::info);
//		log.info(boardService.getList());
		
	}
	
	@Test
	public void testExistsReview(){
		
		// 두 방식 다 사용 가능
		service.existsReview(24L, "id1");
	}
	
	
	@Test
	public void testInsert(){
		
		ReviewVO vo = new ReviewVO();
		
		vo.setContent("ddd");
		vo.setId("ddd");
		vo.setContent("ddd");
		vo.setContent("ddd");
		
		service.add(vo);
	}
	@Test
	public void testDelete(){
		
		// 두 방식 다 사용 가능
//		service.getListBy("id1").forEach(log::info);
//		log.info(boardService.getList());
		if(service.remove(154L)){
			log.info("성공적으로 삭제되었습니다.");
		}
		
	}
	
}
