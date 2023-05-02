package com.chanyongyang.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.CouponVO;

import lombok.extern.log4j.Log4j;

/**
 * 
 * @author 박연재
 * ProductService 테스트 (추가, 조회, 수정, 삭제)
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CouponServiceTests {
	
	@Autowired
	private CouponService service;
	
	
	@Test
	private void testInsert(){
		
		CouponVO vo = new CouponVO();
		vo.setCouName("한글날 특별 할인 쿠폰");
		vo.setCouPrice(5000);
		
		service.register(vo);
	}
	
}
