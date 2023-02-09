package com.fin.kimo.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.kimo.model.dao.StatisticsMapper;
import com.fin.kimo.model.dto.PaidServiceDto;
import com.fin.kimo.model.dto.StatisticsBodyDto;
import com.fin.kimo.model.dto.StatisticsTallDto;

@Service
public class StatisticsBizImpl implements StatisticsBiz{
	
	@Autowired
	private StatisticsMapper statisticsMapper;

	@Override
	public List<StatisticsTallDto> selectTallList() {
		return statisticsMapper.selectTallList();
	}

	@Override
	public List<StatisticsBodyDto> selectBodyList() {
		// TODO Auto-generated method stub
		return statisticsMapper.selectBodyList();
	}

	
	

}
