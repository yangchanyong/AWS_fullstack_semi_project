package com.chanyongyang.mapper;

import lombok.extern.log4j.Log4j;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.ProCodeVO;

/**
 * @author DG
 * @since 0406
 * 상품을 DB에 CRUD작업을 위한 tests클래스
 */
@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {

	@Autowired
	private ProductMapper mapper;
	
	@Test
	public void testExist(){
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetList(){
		
		log.info(mapper.getList());
	}
	
	@Test
	public void testGet(){
		log.info(mapper.get(9L));
	}
	
	@Test
	public void testList(){
		log.info(mapper.getList());
	}
	
	/**
	 * @author ycy
	 * @since 23/04/10
	 * paging test
	 */
	@Test
	public void testListWithPaging() {
		mapper.getListWithPaging(new Criteria(1, 24)).forEach(log::info);;
	}
	
	/**
	 * @author ycy
	 * @since 23/04/11
	 * paging 글 갯수 test
	 */
	@Test
	public void testGetTotalCnt() {
//		log.info(mapper.getTotalCnt(new Criteria(0, 24, 1, null, "오리")));
	}
	@Test
	public void testNewProductTest() {
		mapper.getNewProduct().forEach(log::warn);
	}
	
	/**
	 * @author ycy
	 * @since 23/04/13
	 * keyword 검색 테스트
	 */
	@Test
	public void testKeyword() {
		mapper.getListWithPaging(new Criteria(1, 20, "오리")).forEach(log::info);;
	}

	
	@Test
	public void testCareProductList(){
		mapper.getCareProductList(new ProCodeVO(1L,2L)).forEach(log::info);
	}
	
	
	// 리스트 검색할 때 카테고리 값을 상품 상세 페이지로 넘길 때까지 임시로 만들어 넣음
	@Test
	public void testRead(){
		mapper.read(23L);
	}
}
