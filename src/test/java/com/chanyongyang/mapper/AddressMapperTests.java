package com.chanyongyang.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chanyongyang.domain.AddressVO;
import com.chanyongyang.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AddressMapperTests {
	@Autowired
	private AddressMapper addressMapper;
	
	@Test
	public void testExist(){
		assertNotNull(addressMapper);
	}

	@Test
	public void testGetList(){
		addressMapper.getList("id1111").forEach(log::info);
	}
	
	@Test
	public void testInsert(){
		AddressVO vo = new AddressVO();
		vo.setAddr("서울특별시 도봉구");
		vo.setAddrDetail("5동 4호");
		vo.setId("id3333");
		vo.setAddrName("세모네 집");
		vo.setRecipient("세모");
		vo.setMemo("문앞에 두고 가주세요");
		vo.setPhone("010-9999-8888");
		addressMapper.insert(vo);
	}
	
	@Test
	public void testRead(){
		Long addrNo = 10L;
		addressMapper.read(addrNo);
	}
	
	@Test
	public void testUpdate(){
		AddressVO vo = addressMapper.read(36L);
		vo.setAddr("업데이트 테스트");
		vo.setAddrDetail("업데이트 상세주소 테스트");
		vo.setId("id1111");
		vo.setAddrName("학교");
		vo.setRecipient("수령인");
		vo.setMemo("메모");
		vo.setPhone("010-0000-9999");
		addressMapper.update(vo);
	}
	
	@Test
	public void testDelete(){
		addressMapper.delete(13L);
	}
	
	@Test
	public void testCount(){
		addressMapper.count("id2222");
	}
	
	@Test
	public void testDeleteData() {
		String id = "ycy01";
		addressMapper.deleteData(id);
	}

}
