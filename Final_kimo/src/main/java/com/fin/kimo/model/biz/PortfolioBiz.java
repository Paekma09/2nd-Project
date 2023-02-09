package com.fin.kimo.model.biz;

import java.util.List;

import com.fin.kimo.model.dto.EduDto;
import com.fin.kimo.model.dto.FilmoDto;
import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.PortfolioDto;
import com.fin.kimo.model.dto.Talent;

public interface PortfolioBiz {
	
	// 회원 정보
	public MemberDto selectMember(String member_id);
	public Talent selectTalent(String member_id);
	public List<PortfolioDto> selectList(String member_id);
	public int insertPort(PortfolioDto portDto);
	public int insertFilmo(FilmoDto filmoDto);
	public PortfolioDto selectDetail(String port_title);
	public List<FilmoDto> selectFilmo(String port_title);
	public int insertFilmo(List<FilmoDto> filmoList);
	public int insertEdu(List<EduDto> eduList);
	public List<EduDto> selectEdu(String port_title);
	public int updatePort(PortfolioDto portDto);
	public int updateFilmo(List<FilmoDto> filmoList);
	public int updateEdu(List<EduDto> eduList);
	public int deletePort(String port_title);
	public int deleteFilmo(String port_title);
	public int deleteEdu(String port_title);  

}
