package com.chanyongyang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chanyongyang.domain.AddressVO;
import com.chanyongyang.mapper.AddressMapper;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
@ToString
public class AddressServiceImpl implements AddressService{
	private AddressMapper addressMapper;

	@Override
	public void register(AddressVO vo) {
		log.info(vo);
		addressMapper.insert(vo);
	}

	@Override
	public AddressVO get(Long addrNo) {
		log.info(addrNo);
		return addressMapper.read(addrNo);
	}

	@Override
	public List<AddressVO> getList(String id) {
		log.info(id);
		return addressMapper.getList(id);
	}

	@Override
	public int modify(AddressVO vo) {
		log.info(vo);
		return addressMapper.update(vo);
	}

	@Override
	public boolean remove(Long addrNo) {
		log.info(addrNo);
		return addressMapper.delete(addrNo) > 0;
	}

	@Override
	public int count(String id) {
		return addressMapper.count(id);
	}

	@Override
	public void deleteData(String id) {
		addressMapper.deleteData(id);
	}

	

	
}
