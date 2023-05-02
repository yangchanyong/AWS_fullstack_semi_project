package com.chanyongyang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.ProCodeVO;
import com.chanyongyang.domain.ProductVO;
import com.chanyongyang.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@ToString
public class ProductServiceImpl implements ProductService{


	private final ProductMapper productMapper;
	

	@Override
	public List<ProductVO> getList(Criteria cri) {
		
		return productMapper.getListWithPaging(cri);
	}
	

	@Override
	public ProductVO get(Long codeNo) {
		return productMapper.get(codeNo);
	}


	@Override
	public int getTotalCnt(Criteria cri) {
		return productMapper.getTotalCnt(cri);
	}


	@Override
	public List<ProductVO> getNewProduct(Criteria cri) {
		return productMapper.getNewProduct();
	}


	@Override
	public List<ProductVO> getCareProduct(ProCodeVO vo) {
		return productMapper.getCareProductList(vo);
	}


	@Override
	public ProCodeVO findBy(Long codeNo) {

		return productMapper.read(codeNo);
	}


	@Override
	public void modifyProCnt(int proCnt, int codeNo) {
		productMapper.updateProCnt(proCnt, codeNo);
	}

}
