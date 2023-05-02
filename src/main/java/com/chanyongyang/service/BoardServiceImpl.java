package com.chanyongyang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chanyongyang.domain.AttachVO;
import com.chanyongyang.domain.BoardVO;
import com.chanyongyang.domain.Criteria;
import com.chanyongyang.mapper.AttachMapper;
import com.chanyongyang.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Log4j
@ToString
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardMapper boardMapper;
	private AttachMapper attachMapper;
	@Override
	public void register(BoardVO vo) {
		boardMapper.insert(vo);
		Long bno = vo.getBno();
		List<AttachVO> list = vo.getAttachs();
		if(list == null || list.size() == 0) {
			return;
		}
		for(AttachVO attach : list) {
			attach.setBno(bno);
			attachMapper.insertBoardAttach(attach);
		}
	}

	@Override
	public BoardVO get(Long bno) {
		return boardMapper.read(bno);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
//		return boardMapper.getListWithPaging(cri);
		return boardMapper.getList(cri);
	}

	@Override
	public boolean modify(BoardVO vo) {
		return boardMapper.update(vo) > 0;
	}

	@Override
	public boolean remove(Long bno) {
		return boardMapper.delete(bno) > 0;
	}

	@Override
	public int getTotalCnt(Criteria cri) {
		return boardMapper.getTotalCnt(cri);
	}

	@Override
	public boolean remove(String id) {
		return boardMapper.deleteData(id) > 0;
	}

	@Override
	public List<BoardVO> getListId(String id) {
		return boardMapper.getListId(id);
	}

}
