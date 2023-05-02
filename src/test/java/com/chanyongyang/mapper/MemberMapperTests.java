package com.chanyongyang.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private SecessionMapper secessionMapper;
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private PayMentMapper payMentMapper;
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private AddressMapper addressMapper;
	
	@Test
	public void testExist(){
		assertNotNull(memberMapper);
	}

	@Test
	public void testGetList(){
		memberMapper.getList().forEach(log::info);
	}

//	@Test
//	public void testGetListBCrpyt(){
//		memberMapper.getList().forEach(log::info);
//		List<?> list = new ArrayList<>();
//		for(int i=0; list.size()>=i; i++) {
//			list.add()
//		}
//	}

	@Test
	public void testRead(){
		String id = "id1111";
		memberMapper.read(id).getPw();
	}
	
	public void testReadBCrypt(){
		String id = "id1111";
//		log.warn(memberMapper.read(id).getPw());
//		String password = memberMapper.read(id).getPw();
//		String salt = BCrypt.gensalt();
//		memberMapper.read(id).setPw(BCrypt.hashpw(password, salt));
//		memberMapper.read(id).setPw(BCrypt.hashpw(password, salt));
	}
	
	@Test
	public void testInsert(){
		MemberVO vo = new MemberVO();
		vo.setId("id3333");
		vo.setPw("1234");
		vo.setName("동그라미");
		vo.setEmail("circle@naver.com");
		vo.setPhone("01033334444");
		vo.setGrantNo(1L);
		vo.setGradeNo(1L);
		memberMapper.insert(vo);
	}
	
	
	@Test
	public void testDelete(){
		String id = "id3333";
		memberMapper.delete(id);
	}
	
	@Test
	public void testUpdate(){
		MemberVO vo = memberMapper.read("id1");
		vo.setName("LDG");
		vo.setEmail("change@naver.com");
		vo.setPhone("01022223333");
		memberMapper.update(vo);
		
	}
	
	@Test
	public void testUpdatePw() {
		MemberVO vo = memberMapper.read("ycy03");
		String salt = BCrypt.gensalt();
		vo.setPw(BCrypt.hashpw("1234", salt));
		memberMapper.updatePw(vo);
	}
	
	@Test
	public void testUpdateBCrypt(){
		MemberVO vo = memberMapper.read("ycy03");
		
		String salt = BCrypt.gensalt();

		vo.setPw(BCrypt.hashpw("1234", salt));
		
		memberMapper.update(vo);
		
	}
	
	@Test
	public void testDeleteData() {
		String id = "ycy03";
		secessionMapper.insert(id);
		
		reviewMapper.updateData(id);
		
		payMentMapper.updateData(id);
		
		boardMapper.deleteData(id);
		
		orderMapper.deleteData(id);
		
		cartMapper.deleteData(id);
		addressMapper.deleteData(id);
		memberMapper.delete(id);
	}
}
