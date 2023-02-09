package com.fin.kimo.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.kimo.model.dao.PortfolioMapper;
import com.fin.kimo.model.dto.EduDto;
import com.fin.kimo.model.dto.FilmoDto;
import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.PortfolioDto;
import com.fin.kimo.model.dto.Talent;

import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor
@Service
public class PortfolioBizImpl implements PortfolioBiz{
	
	@Autowired
	private PortfolioMapper portfolioMapper;
	
	// 회원 정보
	@Override
	public MemberDto selectMember(String member_id) {
		return portfolioMapper.selectMember(member_id);
	}

	@Override
	public Talent selectTalent(String member_id) {
		return portfolioMapper.selectTalent(member_id);
	}

	//포폴 리스트 조회
	@Override
	public List<PortfolioDto> selectList(String member_id) {
		return portfolioMapper.selectList(member_id);
	}
	
	//포폴 등록
	@Override
	public int insertPort(PortfolioDto portDto) {
		return portfolioMapper.insertPort(portDto);
	}

	@Override
	public int insertFilmo(FilmoDto filmoDto) {
		return portfolioMapper.insertFilmo(filmoDto);
	}
	
	// 필모그래피,학력 다중 db 저장
	@Override
	public int insertFilmo(List<FilmoDto> filmoList) {
		int res = 0;
	    for(FilmoDto filmoDto : filmoList) {
	        res += portfolioMapper.insertFilmo(filmoDto);
	    }
	    return res;
	}
	
	@Override
	public int insertEdu(List<EduDto> eduList) {
		int res11 = 0;
		for(EduDto eduDto : eduList) {
			res11 += portfolioMapper.insertEdu(eduDto);
		}
		return res11;
	}
	
	//포폴 디테일
	@Override
	public PortfolioDto selectDetail(String port_title) {
		return portfolioMapper.selectDetail(port_title);
	}

	@Override
	public List<FilmoDto> selectFilmo(String port_title) {
		return portfolioMapper.selectFilmo(port_title);
	}

	@Override
	public List<EduDto> selectEdu(String port_title) {
		return portfolioMapper.selectEdu(port_title);
	}

	//수정
	@Override
	public int updatePort(PortfolioDto portDto) {
		return portfolioMapper.updatePort(portDto);
	}

	@Override
	public int updateFilmo(List<FilmoDto> filmoList) {
		int res = 0;
	    for(FilmoDto filmoDto : filmoList) {
	        res += portfolioMapper.updateFilmo(filmoDto);
	    }
	    return res;
	}

	@Override
	public int updateEdu(List<EduDto> eduList) {
		int res11 = 0;
		for(EduDto eduDto : eduList) {
			res11 += portfolioMapper.updateEdu(eduDto);
		}
		return res11;
	}
	
	//삭제
	@Override
	public int deleteFilmo(String port_title) {
		return portfolioMapper.deleteFilmo(port_title);
	}

	@Override
	public int deleteEdu(String port_title) {
		return portfolioMapper.deleteEdu(port_title);
	}
	
	@Override
	public int deletePort(String port_title) {
		return portfolioMapper.deletePort(port_title);
	}

	

	
	
	

	
	
}
