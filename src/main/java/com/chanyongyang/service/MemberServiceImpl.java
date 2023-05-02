package com.chanyongyang.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.ReviewVO;
import com.chanyongyang.domain.SecessionVO;
import com.chanyongyang.mapper.AddressMapper;
import com.chanyongyang.mapper.BoardMapper;
import com.chanyongyang.mapper.CartMapper;
import com.chanyongyang.mapper.CouMemberMapper;
import com.chanyongyang.mapper.MemberMapper;
import com.chanyongyang.mapper.OrderMapper;
import com.chanyongyang.mapper.PayMentMapper;
import com.chanyongyang.mapper.ReviewMapper;
import com.chanyongyang.mapper.SecessionMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@ToString
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	private MemberMapper memberMapper;
	private SecessionMapper secessionMapper;
	private ReviewMapper reviewMapper;
	private PayMentMapper payMentMapper;
	private BoardMapper boardMapper;
	private OrderMapper orderMapper;
	private CartMapper cartMapper;
	private AddressMapper addressMapper;
	private CouMemberMapper couMemberMapper;
	
	@Override
	public void register(MemberVO vo) {
//		member.setPw(BCrypt.hashpw(member.getPw(), BCrypt.gensalt()));
		String password = vo.getPw();
		String salt = BCrypt.gensalt();
		vo.setPw(org.mindrot.jbcrypt.BCrypt.hashpw(password, salt));
		memberMapper.insert(vo);
	}
	
	@Override
	public MemberVO get(String id) {
		return memberMapper.read(id);
	}

	@Override
	public List<MemberVO> getList() {
		return memberMapper.getList();
	}

	@Override
	public boolean modify(MemberVO vo) {
		return memberMapper.update(vo) > 0;
	}

	@Override
	public boolean modifyPw(MemberVO vo) {
		String password = vo.getPw();
		String salt = BCrypt.gensalt();
		vo.setPw(org.mindrot.jbcrypt.BCrypt.hashpw(password, salt));
		return memberMapper.updatePw(vo) > 0; 
	}

	@Override
	@Transactional
	public void remove(String id) {
		secessionMapper.insert(id);
		reviewMapper.updateData(id);
		payMentMapper.updateData(id);
		boardMapper.deleteData(id);
		orderMapper.deleteData(id);
		cartMapper.deleteData(id);
		addressMapper.deleteData(id);
		couMemberMapper.deleteData(id);
		memberMapper.delete(id);
	}
	
}
