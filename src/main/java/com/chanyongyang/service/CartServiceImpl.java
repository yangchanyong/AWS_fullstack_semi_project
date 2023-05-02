package com.chanyongyang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.ProductVO;
import com.chanyongyang.mapper.CartMapper;
import com.chanyongyang.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@ToString
@AllArgsConstructor
public class CartServiceImpl implements CartService{

	private MemberMapper memberMapper;
	private ProductService productMapper;
	private CartMapper cartMapper;
	
	@Override
	public void register(CartVO cvo) {
		cartMapper.insert(cvo);
	}

	@Override
	public List<CartVO> getList(MemberVO vo) {
		return cartMapper.getList(memberMapper.read(vo.getId()));
	}

	@Override
	public void modify(int cartCnt, Long codeNo, String id) {
		cartMapper.update(cartCnt, codeNo, id);
	}

	@Override
	public void remove(Long codeNo, String id) {
		cartMapper.delete(codeNo, id);
	}

	@Override
	public CartVO getSelectOne(Long codeNo, String id) {
		return cartMapper.getSelectOne(codeNo, id);
	}

	@Override
	public void removeAll(String id) {
		cartMapper.deleteAll(id);		
	}

	@Override
	public void remove(String id) {
		cartMapper.deleteData(id);
	}


}
