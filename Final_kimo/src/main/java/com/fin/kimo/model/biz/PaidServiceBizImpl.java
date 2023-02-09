package com.fin.kimo.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.kimo.model.dao.PaidServiceMapper;
import com.fin.kimo.model.dto.PaidServiceDto;

@Service
public class PaidServiceBizImpl implements PaidServiceBiz{
	
	@Autowired
	private PaidServiceMapper paidServiceMapper;

	@Override
	public List<PaidServiceDto> selectPaidServiceList() {
		return paidServiceMapper.selectPaidServiceList();
	}

	@Override
	public PaidServiceDto selectPaidService(String member_id) {
		return paidServiceMapper.selectPaidService(member_id);
	}
 
	@Override
	public int insertPaidService(PaidServiceDto dto) {
		// TODO Auto-generated method stub
		return paidServiceMapper.insertPaidService(dto);
	}

	@Override
	public int insertPaidService2(PaidServiceDto dto) {
		// TODO Auto-generated method stub
		return paidServiceMapper.insertPaidService2(dto);

	}


	

}
