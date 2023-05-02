package com.chanyongyang.mapper;

import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.MemberVO;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertNotNull;

/**
 * @author DG
 * @date 0411
 * CartMapper를 test하기 위한 클래스
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTests {
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private ProductMapper productMapper;
	@Test
	public void testExist(){
		assertNotNull(cartMapper);
	}

	/**
	 * @author DG
	 * @date 0411
	 * 해당 회원의 장바구니 목록을 조회하기 위한 메서드
	 */
	@Test
	public void testGetList(){
		cartMapper.getList(memberMapper.read("id1")).forEach(log::info);
	}
	
	/**
	 * @author DG
	 * @date 0412
	 * 해당 회원의 상품을 장바구니에 추가하는 메서드
	 */
	@Test
	public void testInsert(){
		String id = memberMapper.read("id1").getId();
		String name = memberMapper.read("id1").getName();
		
		Long code = 82L;
		CartVO cvo = new CartVO();
		cvo.setCodeNo(code);
		cvo.setId(id);
		cvo.setName(name);
		cvo.setProName(productMapper.get(code).getProName());
		cvo.setCartCnt(8);		
		cvo.setProSalePrice(productMapper.get(code).getProSalePrice().intValue());
		//상품 update 추가되면 상품에서 수량 수정 되야함
		cartMapper.insert(cvo);
	}
	
	/**
	 * @author DG
	 * @date 0412
	 * 상품의 수량을 수정하기 위해 상품을 불러오는 메서드
	 */
	@Test
	public void testUpdate(){
		cartMapper.update(15, 226L, "id1");
//		testGet();
	}
	

	/**
	 * @author DG
	 * @date 2023. 4. 12.
	 * 회원의 상품 단일 조회
	 */
	@Test
	public void testGet(){
		log.info(cartMapper.getSelectOne(22L, memberMapper.read("id1").getId()));
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 12.
	 * 회원의 단일 상품을 삭제
	 */
	@Test
	public void testDelete(){
		cartMapper.delete(88L, "id1");
	}
	
	/**
	 * @author ycy
	 * @date 2023. 4. 21.
	 * 회원 탈퇴시 장바구니 삭제
	 */
	@Test
	public void testDeleteData() {
		String id = "ycy01";
		cartMapper.deleteData(id);
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 21.
	 * 상품 결제 후 장바구니 삭제
	 */
	@Test
	public void testDeleteAll(){
		cartMapper.deleteAll("id1");
	}
	
}

