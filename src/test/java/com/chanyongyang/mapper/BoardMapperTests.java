package com.chanyongyang.mapper;

import lombok.extern.log4j.Log4j;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.chanyongyang.domain.BoardVO;
import com.chanyongyang.domain.Criteria;

/**
 * @author ycy
 * @since 23/04/13
 * 게시판 DB에 CRUD작업을 위한 tests클래스
 */
@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * mapper null test
	 */
	@Test
	public void testExist() {
		assertNotNull(mapper);
		log.warn(mapper);
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글 상세보기 test
	 */
	@Test 
	public void testRead() {
		log.info(mapper.read(2L));
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글 카테고리별 리스트 출력 test
	 */
	@Test
	public void testList() {
		mapper.getList(new Criteria(1, 3, null, 1)).forEach(log::info);;
	}
	
	@Test
	public void testListId() {
		String id = "id1111";
		mapper.getListId(id);
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글 페이징 test
	 */
	@Test
	public void testListWithPaging() {
		mapper.getList(new Criteria(1, 1, null, 1)).forEach(log::info);;
	}
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글 페이징 test 2
	 */
	@Test
	public void testGetTotalCnt() {
		mapper.getTotalCnt(new Criteria(1, 1, null, 1));
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글 생성 test
	 */
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setId("ycy");
		vo.setTitle("공지사항 mapper test");
		vo.setContent("공지사항 내용 mapper test");
		vo.setCategory(1);
		mapper.insert(vo);
	}

	@Test
	public void testInsert2() {
		BoardVO vo = new BoardVO();
		vo.setId("id1");
		vo.setTitle("공지사항 mapper test");
		vo.setContent("공지사항 내용 mapper test");
		vo.setAddr("지구 어딘가");
		vo.setCompany("지구어딘가");
		vo.setCategory(2);
		mapper.insert(vo);
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글 삭제 test
	 */
	@Test
	public void testDelete() {
		Long bno = 26L;
		log.info(mapper.read(bno));
		log.info(mapper.delete(bno));
		log.info(mapper.read(bno));
	}
	
	@Test
	public void testDeleteData() {
		String id = "ycy01";
		mapper.deleteData(id);
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글 수정 test
	 */
	@Test
	public void testUpdate() {
		BoardVO vo = mapper.read(4L);
		log.warn(mapper.read(4L));
		vo.setTitle("공지사항 수정 제목");
		vo.setContent("공지사항 수정 내용");
		mapper.update(vo);
		log.warn(mapper.read(4L));
		
	}
	
}
