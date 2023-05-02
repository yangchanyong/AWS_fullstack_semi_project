package com.chanyongyang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.CouMemberVO;
import com.chanyongyang.domain.OrderVO;
import com.chanyongyang.mapper.CartMapper;
import com.chanyongyang.mapper.MemberMapper;
import com.chanyongyang.mapper.OrderMapper;
import com.chanyongyang.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@ToString
@AllArgsConstructor
public class OrderServiceImpl implements OrderServicve{
	private OrderMapper orderMapper;
	private MemberMapper memberMapper;
	private CartMapper cartMapper; 
	private ProductMapper productMapper;
	private CouMemberService couMemberService;
	
	
	@Override
	public void register(Long codeNo, String id, int payNo, int addrNo, int coumemberNo, int cartBuy, int cartCnt) {
		if(cartBuy==0){
			List<CartVO> cart = cartMapper.getList(memberMapper.read(id));
			CouMemberVO cou = couMemberService.get(id, coumemberNo);
			for(int i=0; i<cart.size(); i++){
					orderMapper.insert(cart.get(i), id, payNo, addrNo, coumemberNo);
			}
		}else{
			System.out.println("조건 탔음");
			int proPrice = Long.valueOf( productMapper.get(codeNo).getProSalePrice()*cartCnt).intValue();
			System.out.println(proPrice);
			CartVO vo = new CartVO(codeNo, id, cartCnt, proPrice); 
			orderMapper.insert(vo, id, payNo, addrNo, coumemberNo);
		}
		List<OrderVO> order = orderMapper.get(payNo, id);

		//구매한 수량 만큼 재고 빼기
		for(int i=0; i<order.size(); i++){
			int proCnt = Long.valueOf(productMapper.get(order.get(i).getCodeNo()).getProCnt()).intValue() - order.get(i).getCartCnt();
			productMapper.updateProCnt(proCnt, Long.valueOf(order.get(i).getCodeNo()).intValue());
		}
	}

	@Override
	public List<OrderVO> get(int payNo, String id) {
		return orderMapper.get(payNo, id);
	}

	@Override
	public List<OrderVO> getList(String id) {
		return orderMapper.getList(id);
	}

	@Override
	public List<OrderVO> getListByCodeNo(Long codeNo) {
		return orderMapper.getList(codeNo);
	}
	
	@Override
	public void remove(int payNo, String id) {
		orderMapper.delete(payNo, id);
	}

	@Override
	public void remove(String id) {
		orderMapper.deleteData(id);
	}
	@Override
	public List<OrderVO> getSelectOne(int payNo, String id) {
		return orderMapper.getSelectOne(payNo, id);
	}



}
