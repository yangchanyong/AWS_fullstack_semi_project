package com.chanyongyang.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.OrderVO;

import lombok.extern.log4j.Log4j;

/**
 * @author DG
 * @date 2023. 4. 19.
 * OrderMapper를 test하기 위한 클래스 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private AddressMapper addressMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Test
	public void testInsert(){
		List<CartVO> cart = cartMapper.getList(memberMapper.read("id1"));
		log.warn("size"+cart.size());
		for(int i=0; i<cart.size(); i++){
			orderMapper.insert(cart.get(i), memberMapper.read("id1").getId(), 34, 31, 2);
			log.warn("가격:::" + cart.get(i).getSalePrice());
		}
		cart.forEach(log::warn);
	}
	
	@Test
	public void testGet(){
		orderMapper.get(35, memberMapper.read("id1").getId());
	}
	
	@Test
	public void testGetList(){
		log.info(orderMapper.getList(memberMapper.read("id2222").getId()));
	}	
	@Test
	public void testDelete(){
		orderMapper.delete(6, memberMapper.read("id1").getId());
	}
	
	@Test
	public void testDeleteData() {
		String id = "ycy01";
		orderMapper.deleteData(id);
	}
	
	@Test
	public void testGetSelectOne(){
		orderMapper.getSelectOne(130, memberMapper.read("id1").getId());
	}
}
