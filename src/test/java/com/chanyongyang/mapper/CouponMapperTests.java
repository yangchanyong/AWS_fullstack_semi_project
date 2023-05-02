package com.chanyongyang.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.CouponVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CouponMapperTests {
	@Autowired
	private CouponMapper mapper;
	
	@Test
	public void testExist(){
		assertNotNull(mapper);
	}
	
	@Test
	public void testRegisterCoupon(){
		CouponVO vo = new CouponVO();
		
		vo.setCouName("한글날 특별 할인 쿠폰");
		vo.setCouPrice(5000);
		mapper.insert(vo);
	}
	
	@Test
	public void testGetListCoupon(){
		mapper.getList();
	}
	
	@Test
	public void testGetOneCoupon(){
		mapper.selectOne(1L);
	}
	
	@Test
	public void testCouponUpdate(){
		CouponVO vo = mapper.selectOne(1L);
		vo.setCouName("수정된 쿠폰 명");
		vo.setCouPrice(10000);
		mapper.update(vo);
			
		
	}
	
	@Test
	public void testCouponDelete(){
		mapper.delete(3L);
	}
	
	
}
