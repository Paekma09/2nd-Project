package com.fin.kimo.model.biz;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fin.kimo.model.dao.AuditionMapper;
import com.fin.kimo.model.dto.ApplicantDto;
import com.fin.kimo.model.dto.AuditionDto;
import com.fin.kimo.model.dto.AuditionTalentDto;
import com.fin.kimo.model.dto.BookmarkDto;
import com.fin.kimo.model.dto.PortfolioDto;

@Service
public class AuditionBizImpl implements AuditionBiz{
	
	@Autowired
	private AuditionMapper auditionMapper;

	@Override
	public List<AuditionDto> selectList() {
		// TODO Auto-generated method stub
		return auditionMapper.selectList();
	}

	@Override
	public AuditionDto selectOne(int audition_no) {
		// TODO Auto-generated method stub
		return auditionMapper.selectOne(audition_no);
	}
	
	@Override
	public AuditionTalentDto selectOneTalent(int audition_no) {
		return auditionMapper.selectOneTalent(audition_no);
	}

	
	@Override
	public int insert(AuditionDto dto) {
		return auditionMapper.insert(dto);
	}
	
	@Override
	public int insert(AuditionTalentDto tdto) {
		return auditionMapper.insertATalent(tdto);
	}
	
	@Override
	public int insertId(AuditionDto dto,String member_id) {
		return auditionMapper.insertId(dto, member_id);
	}

	@Override
	public int update(AuditionDto dto) {
		// TODO Auto-generated method stub
		return auditionMapper.update(dto);
	}

	@Override
	public int delete(int audition_no) {
		// TODO Auto-generated method stub
		return auditionMapper.delete(audition_no);
	}
	
	@Override
	public int apply(ApplicantDto dto) {
		return auditionMapper.apply(dto);
	}
	
	@Override
	public int applyId(ApplicantDto dto,String member_id) {
		return auditionMapper.applyId(dto, member_id);
	}

	@Override
	public List<AuditionDto> selectListEmp(String type) {
		return auditionMapper.selectListEmp(type);
	}

	@Override
	public List<AuditionDto> selectListJob(String type) {
		return auditionMapper.selectListJob(type);
	}


	@Override
	public List<ApplicantDto> artManagementform(String member_id) {
		return auditionMapper.artManagementform(member_id);
	}

	
	@Override
	public List<AuditionDto> comManagementform(String member_id) {
		return auditionMapper.comManagementform(member_id);
	}
	
	@Override
	public List<ApplicantDto> comManagementform2(int audition_no) {
		return auditionMapper.comManagementform2(audition_no);
	}
	
	@Override
	public List<ApplicantDto> comManagementform2name(int audition_no) {
		return auditionMapper.comManagementform2name(audition_no);
	}


	@Override
	public List<ApplicantDto> selectListSitIng(String member_id) {
		return auditionMapper.selectListSitIng(member_id);
	}

	@Override
	public List<ApplicantDto> selectListSitEnd(String member_id) {
		return auditionMapper.selectListSitEnd(member_id);
	}
	
	@Override
	public List<BookmarkDto> selectListBookmark(String member_id) {
		return auditionMapper.selectListBookmark(member_id);
	}

	
	@Override
	public List<AuditionDto> selectListSitIngCom(String member_id){
		return auditionMapper.selectListSitIngCom(member_id);
	}
	@Override
	public List<AuditionDto> selectListSitEndCom(String member_id){
		return auditionMapper.selectListSitEndCom(member_id);
	}

	@Override
	public int sitChange(String audition_situation, int applicant_no) {
		return auditionMapper.sitChange(audition_situation, applicant_no);
	}

	@Override
	public int bookmark(BookmarkDto dto, String member_id, int audition_no) {
		return auditionMapper.bookmark(dto, member_id, audition_no);
	}

	@Override
	public List<PortfolioDto> portList(String artist) {
		return auditionMapper.portList(artist);
	}

	










}
