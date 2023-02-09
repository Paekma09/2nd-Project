package com.fin.kimo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.fin.kimo.model.dto.PaidServiceDto;



@Mapper
public interface PaidServiceMapper {
	
	@Select("select MEMBER_ID from `MEMBER`\r\n")
	List<PaidServiceDto>selectPaidServiceList();

	@Select("select * FROM SERVICE WHERE MEMBER_ID=#{member_id}")
	PaidServiceDto selectPaidService(String member_id);
	
	@Insert(" INSERT INTO SERVICE (  service_title, service_date, service_end, service_method, member_id) VALUES( #{service_title}, NOW(), NOW(),#{service_method}, #{member_id}) ")
	int insertPaidService(PaidServiceDto dto);
	
	@Insert(" INSERT INTO SERVICE (  service_title, service_date, service_end, service_method, member_id) VALUES( #{service_title}, NOW(), NOW(),#{service_method}, #{member_id}) ")
	int insertPaidService2(PaidServiceDto dto);
}
