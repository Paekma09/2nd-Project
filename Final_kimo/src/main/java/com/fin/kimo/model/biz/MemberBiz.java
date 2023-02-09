package com.fin.kimo.model.biz;

import java.util.Optional;

import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.Talent;

public interface MemberBiz {

	public int insert(MemberDto dto);
	
	public int insert(Talent talent);
	
	public Optional<MemberDto> checkId(String member_id);
	
	public Optional<MemberDto> checkPhone(String member_phone);
	
	public Optional<MemberDto> checkEmail(String member_email);
	
}
