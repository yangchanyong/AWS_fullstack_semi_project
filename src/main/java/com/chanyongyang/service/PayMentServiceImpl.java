package com.chanyongyang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chanyongyang.domain.PayMentVO;
import com.chanyongyang.mapper.PayMentMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@ToString
@AllArgsConstructor
public class PayMentServiceImpl implements PayMentService{
	
	private PayMentMapper payMentMapper;	
	@Override
	public void register(int payCode, String id, String payMethod, String cardCompany, String cardNumber, String installment) {
		payMentMapper.insert(payCode, id, payMethod, cardCompany, cardNumber, installment);
	}

	@Override
	public PayMentVO get(int payNo, String id) {
		return payMentMapper.get(payNo, id);
	}

	@Override
	public List<PayMentVO> getList(String id) {
		return payMentMapper.getList(id);
	}

	@Override
	public List<PayMentVO> getList() {
		return payMentMapper.getAList();
	}

	@Override
	public PayMentVO getPayNo(int payCode, String id) {
		return payMentMapper.getPayNo(payCode, id);
	}

	@Override
	public void updateData(String id) {
		payMentMapper.updateData(id);
	}
	

}
