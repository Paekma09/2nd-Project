package com.fin.kimo.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.Talent;

@Mapper
public interface MemberDao {

	@Insert("INSERT INTO MEMBER VALUES(#{member_id}, #{member_password}, #{member_name}, #{member_addr},"
			+ "#{member_phone}, #{member_email}, #{member_birth}, #{member_type}, 'user', #{member_gender},"
			+ "#{member_tall}, #{member_keyword}, #{member_body}) ")
	int insertMember(MemberDto dto);

	@Insert(" INSERT INTO TALENT VALUES(#{member_id}, #{talent_music}, #{talent_dance}, "
			+ "#{talent_sports}, #{talent_language}, #{talent_etc}) ")
	int insertTalent(Talent talent);

	
	@Select(" SELECT * FROM MEMBER WHERE MEMBER_ID = #{member_id} ")
	MemberDto checkId(String member_id);

	@Select(" SELECT * FROM MEMBER WHERE MEMBER_PHONE = #{member_phone} ")
	MemberDto checkPhone(String member_phone);
	
	@Select(" SELECT * FROM MEMBER WHERE MEMBER_EMAIL = #{member_email} ")
	MemberDto checkEmail(String member_email);

	
	

	
	
	
}
