package com.fin.kimo.model.biz;

import java.util.List;

import com.fin.kimo.model.dto.PaidServiceDto;
import com.fin.kimo.model.dto.StatisticsBodyDto;
import com.fin.kimo.model.dto.StatisticsTallDto;

public interface StatisticsBiz {
	
	public List<StatisticsTallDto>selectTallList();
	public List<StatisticsBodyDto>selectBodyList();
	
}
