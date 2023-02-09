package com.fin.kimo.model.biz;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.fin.kimo.model.dto.ApplicantDto;
import com.fin.kimo.model.dto.AuditionDto;
import com.fin.kimo.model.dto.AuditionTalentDto;
import com.fin.kimo.model.dto.BookmarkDto;
import com.fin.kimo.model.dto.PortfolioDto;

public interface AuditionBiz {
	public List<AuditionDto> selectList(); 

	
	public AuditionDto selectOne(int audition_no);
	public AuditionTalentDto selectOneTalent(int audition_no);
	public int insert(AuditionDto dto);
	public int insert(AuditionTalentDto tdto);
	public int insertId(AuditionDto dto, String member_id);
	public int update(AuditionDto dto);
	public int delete(int audition_no);
	

	
	public List<PortfolioDto> portList(String artist);
	public int apply(ApplicantDto dto);
	public int applyId(ApplicantDto dto, String member_id);
	
	public List<AuditionDto> selectListEmp(String type);
	public List<AuditionDto> selectListJob(String type);
	

	public List<ApplicantDto> artManagementform(String member_id);
	
	public List<AuditionDto> comManagementform(String member_id);
	public List<ApplicantDto> comManagementform2(int audition_no);
	public List<ApplicantDto> comManagementform2name(int audition_no);
	
	public List<ApplicantDto> selectListSitIng(String member_id);
	public List<ApplicantDto> selectListSitEnd(String member_id);
	public List<BookmarkDto> selectListBookmark(String member_id);
	
	
	public List<AuditionDto> selectListSitIngCom(String member_id);
	public List<AuditionDto> selectListSitEndCom(String member_id);
	
	
	public int sitChange(String audition_situation, int applicant_no);
	
	public int bookmark(BookmarkDto dto, String member_id, int audition_no);

}
