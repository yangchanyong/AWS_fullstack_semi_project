package com.chanyongyang.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chanyongyang.controller.UploadController;
import com.chanyongyang.domain.AttachFileDTO;
import com.chanyongyang.domain.AttachVO;
import com.chanyongyang.domain.PayMentVO;
import com.chanyongyang.domain.ReviewVO;
import com.chanyongyang.mapper.AttachMapper;
import com.chanyongyang.mapper.PayMentMapper;
import com.chanyongyang.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


/**
 * 
 * @author pyj
 * 리뷰 서비스 (목록, 단일, 추가, 삭제)
 */
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	
	
	private ReviewMapper reviewMapper;
	private AttachMapper attachMapper;
	private PayMentMapper payMentMapper;
	
	
	@Override	
	public List<ReviewVO> getListBy(String id) {
		
		return reviewMapper.getListById(id);
	}
	
	

	@Override
	public ReviewVO findBy(Long rno) {

		return reviewMapper.selectOneByRno(rno);
	}



	@Override
	public ReviewVO findBy(Long codeNo, String id) {
		return reviewMapper.selectOne(codeNo, id);
	}

	@Override
	public void add(ReviewVO vo) {
		
		reviewMapper.insertSelectKey(vo);
		Long rno = vo.getRno();
		List<AttachVO> list = vo.getAttachs();
		int idx = 0;
		for(AttachVO attach : list){
			attach.setRno(rno);
			attachMapper.insertReviewAttach(attach); // DB에 들어갈 재료
			System.out.println(attach);
		}
		
	}

	@Override
	@Transactional
	public boolean remove(Long rno) {
		attachMapper.deleteAll(rno);
		return reviewMapper.delete(rno);
	}



	@Override
	public List<ReviewVO> getListByCodeNo(Long codeNo) {
		return reviewMapper.getListByCodeNo(codeNo);
	}
	
	@Override
	public String deleteFile(AttachFileDTO dto) {
		System.out.println(dto);
		String s = UploadController.getPATH() + "/" + dto.getPath() + "/" + dto.getUuid() + "_" + dto.getOrigin();
		
		File file = new File(s);	
		file.delete();
		if(dto.isImage()){
			s = UploadController.getPATH() + "/" + dto.getPath() + "/s_" + dto.getUuid() + "_" + dto.getOrigin();
			file = new File(s);
			file.delete();
		}
		return dto.getUuid();
	}

	@Override
	public void updateData(String id) {
		reviewMapper.updateData(id);
	}



	@Override
	public int existsReview(Long codeNo, String id) {
		return reviewMapper.selectExistsReview(codeNo, id);
	}



	@Override
	public int getTotalReviewCnt(Long codeNo) {
		return reviewMapper.getTotalReviewCnt(codeNo);
	}

	@Override
	public List<ReviewVO> getListCodeNo(Long codeNo) {
		return reviewMapper.getListCodeNo(codeNo);
	}

}


