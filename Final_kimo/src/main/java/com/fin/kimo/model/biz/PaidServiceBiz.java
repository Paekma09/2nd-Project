package com.fin.kimo.model.biz;

import java.util.List;

import com.fin.kimo.model.dto.PaidServiceDto;

public interface PaidServiceBiz {
	
	public List<PaidServiceDto>selectPaidServiceList();
	public PaidServiceDto selectPaidService(String member_id);
	int insertPaidService (PaidServiceDto dto);
	int insertPaidService2 (PaidServiceDto dto);
}
