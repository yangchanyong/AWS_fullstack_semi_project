package com.chanyongyang.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.ProCodeVO;
import com.chanyongyang.domain.ProductVO;
import com.chanyongyang.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

/**
 * 
 * @author 박연재
 * ProductService 테스트 (추가, 조회, 수정, 삭제)
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {

	@Autowired
	private ProductService service;
	
	private ProductMapper mapper;
	
	@Test
	public void textExists(){
		
		// assertNotNull로 먼저 서비스의 null 여부를 따진다.
		assertNotNull(service);
//		log.info(service);
	}
	
	@Test
	public void testGet(){
		ProductVO vo = service.get(1L);
		log.info(vo);
		
	}

	
	
	@Test
	public void testGetList(){
		
		// 두 방식 다 사용 가능
		service.getList(new Criteria()).forEach(log::info);
//		log.info(boardService.getList());
		
	}
	
	
	@Test
	public void testGetCareProductList(){
		
		ProCodeVO vo = new ProCodeVO(1L, 2L);
		service.getCareProduct(vo);
	}
}
