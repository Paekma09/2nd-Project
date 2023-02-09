package com.fin.kimo.model.biz;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.kimo.model.dao.MemberDao;
import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.Talent;

@Service
public class MemberBizImpl implements MemberBiz{

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int insert(MemberDto dto) {
		return memberDao.insertMember(dto);
	}
	
	@Override
	public int insert(Talent talent) {
		return memberDao.insertTalent(talent);
	}

	@Override
	public Optional<MemberDto> checkId(String member_id) {
		MemberDto checkId = memberDao.checkId(member_id); 
		return Optional.ofNullable(checkId);
	}

	@Override
	public Optional<MemberDto> checkPhone(String member_phone) {
		MemberDto checkPhone = memberDao.checkPhone(member_phone);
		return Optional.ofNullable(checkPhone);
	}

	@Override
	public Optional<MemberDto> checkEmail(String member_email) {
		MemberDto checkEmail = memberDao.checkEmail(member_email);
		return Optional.ofNullable(checkEmail);
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
