package com.fin.kimo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.fin.kimo.model.dto.PaidServiceDto;
import com.fin.kimo.model.dto.StatisticsBodyDto;
import com.fin.kimo.model.dto.StatisticsTallDto;


@Mapper
public interface StatisticsMapper {
	
	/*
	 * @Select("select MEMBER_TALL from AUDITION_SITUATION\r\n" +
	 * "left join APPLICANT using(APPLICANT_NO)\r\n" +
	 * "left join MEMBER using(MEMBER_ID)\r\n" + "WHERE  AS_PASS = TRUE;")
	 */
	@Select("select MEMBER_TALL,MEMBER_GENDER  from `MEMBER`\r\n"
			+ "WHERE MEMBER_TALL IS NOT NULL")
	List<StatisticsTallDto>selectTallList();
	
	@Select("select MEMBER_BODY,MEMBER_GENDER  from `MEMBER` WHERE MEMBER_BODY IS NOT NULL")
	List<StatisticsBodyDto>selectBodyList();
	

	
}
