package com.fin.kimo.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.fin.kimo.model.dto.ApplicantDto;
import com.fin.kimo.model.dto.AuditionDto;
import com.fin.kimo.model.dto.AuditionTalentDto;
import com.fin.kimo.model.dto.BookmarkDto;
import com.fin.kimo.model.dto.PortfolioDto;

@Mapper
public interface AuditionMapper {
	
	@Select(" SELECT * FROM AUDITION ORDER BY AUDITION_NO DESC ")
	List<AuditionDto> selectList();
	
//	@Insert(" INSERT INTO AUDITION VALUES(NULL,#{member_id},#{audition_employ},#{audition_job},#{audition_title},#{audition_director},#{audition_company},#{audition_type},#{audition_location},#{audition_pay}"
//			+ ",#{audition_detail},#{audition_phone},#{audition_date},#{audition_start},#{audition_end},now(),1,1, #{audition_keyword}, #{audition_body}) ")
//	int insert(AuditionDto dto, String member_id);
	
	@Insert(" INSERT INTO AUDITION VALUES(NULL,'임시',#{audition_employ},#{audition_job},#{audition_title},#{audition_director},#{audition_company},#{audition_type},#{audition_location},#{audition_pay}"
			+ ",#{audition_detail},#{audition_phone},#{audition_date},#{audition_start},#{audition_end},now(),1,1, #{audition_keyword}, #{audition_body}) ")
	int insert(AuditionDto dto);
	
	@Insert(" INSERT INTO AUDITION_TALENT VALUES(NULL, #{atalent_music}, #{atalent_dance}, "
			+ "#{atalent_sports}, #{atalent_language}, #{atalent_etc}) ")
	int insertATalent(AuditionTalentDto tdto);
	
	@Update(" UPDATE AUDITION SET MEMBER_ID = #{member_id} ")
	int insertId(AuditionDto dto, String member_id);
	
	@Select(" SELECT * FROM AUDITION WHERE AUDITION_NO = #{audition_no} ")
	AuditionDto selectOne(int audition_no);
	
	@Select(" SELECT * FROM AUDITION_TALENT WHERE AUDITION_NO = #{audition_no} ")
	AuditionTalentDto selectOneTalent(int audition_no);
	
	
	@Update(" UPDATE AUDITION SET AUDITION_TITLE=#{audition_title}, AUDITION_DIRECTOR=#{audition_director}, AUDITION_COMPANY=#{audition_company}, AUDITION_TYPE=#{audition_type}, AUDITION_LOCATION=#{audition_location}, AUDITION_PAY=#{audition_pay}"
			+ ", AUDITION_DETAIL=#{audition_detail}, AUDITION_PHONE=#{audition_phone}, AUDITION_DATE=#{audition_date}, AUDITION_START=#{audition_start}, AUDITION_END=#{audition_end} WHERE AUDITION_NO=#{audition_no} ")
	int update(AuditionDto dto);
	
	@Delete(" DELETE FROM AUDITION WHERE AUDITION_NO = #{audition_no} ")
	int delete(int audition_no);
	
	@Select(" SELECT * FROM PORTFOLIO WHERE MEMBER_ID = #{artist} ")
	List<PortfolioDto> portList(String artist);

	
	@Insert(" INSERT INTO APPLICANT VALUES(NULL, '임시', #{audition_no}, #{port_title}, '프로필 확인 전') ")
	int apply(ApplicantDto dto);
	
	@Update(" UPDATE APPLICANT SET MEMBER_ID = #{member_id} ")
	int applyId(ApplicantDto dto, String member_id);
	
	@Select(" SELECT * FROM AUDITION WHERE AUDITION_EMPLOY = #{type} ORDER BY AUDITION_NO DESC ")
	List<AuditionDto> selectListEmp(String type);
	
	@Select(" SELECT * FROM AUDITION WHERE AUDITION_JOB = #{type} ORDER BY AUDITION_NO DESC ")
	List<AuditionDto> selectListJob(String type);
	
	
	@Select(" SELECT AUDITION.AUDITION_NO, AUDITION.AUDITION_TITLE, AUDITION.AUDITION_END, AUDITION_SITUATION, APPLICANT.MEMBER_ID FROM APPLICANT "
			+ " LEFT JOIN AUDITION ON APPLICANT.AUDITION_NO = AUDITION.AUDITION_NO WHERE APPLICANT.MEMBER_ID = #{member_id} ORDER BY AUDITION.AUDITION_END DESC")
	List<ApplicantDto> artManagementform(String member_id);
	
	@Select(" SELECT * FROM AUDITION WHERE MEMBER_ID = #{member_id} ORDER BY AUDITION_NO DESC ")
	List<AuditionDto> comManagementform(String member_id);
	
	@Select(" SELECT AUDITION.AUDITION_TITLE, AUDITION.AUDITION_NO, AUDITION_SITUATION, APPLICANT.MEMBER_ID, APPLICANT_NO, PORT_TITLE FROM APPLICANT "
			+ " LEFT JOIN AUDITION ON APPLICANT.AUDITION_NO = AUDITION.AUDITION_NO WHERE APPLICANT.AUDITION_NO= #{audition_no} ORDER BY AUDITION.AUDITION_END DESC")
	List<ApplicantDto> comManagementform2(int auditon_no);
	
	
	@Select(" SELECT MEMBER.MEMBER_NAME FROM APPLICANT "
			+ " LEFT JOIN MEMBER ON APPLICANT.MEMBER_ID = MEMBER.MEMBER_ID WHERE APPLICANT.AUDITION_NO= #{audition_no} ORDER BY APPLICANT_NO DESC")
	List<ApplicantDto> comManagementform2name(int auditon_no);
	
	@Select(" SELECT AUDITION.AUDITION_NO, AUDITION.AUDITION_TITLE, AUDITION.AUDITION_END, AUDITION_SITUATION, APPLICANT.MEMBER_ID FROM APPLICANT "
			+ " LEFT JOIN AUDITION ON APPLICANT.AUDITION_NO = AUDITION.AUDITION_NO WHERE APPLICANT.MEMBER_ID = #{member_id} AND AUDITION.AUDITION_END > CURDATE() ORDER BY AUDITION.AUDITION_END DESC")
	List<ApplicantDto> selectListSitIng(String member_id);
	
	@Select(" SELECT AUDITION.AUDITION_NO, AUDITION.AUDITION_TITLE, AUDITION.AUDITION_END, AUDITION_SITUATION FROM APPLICANT "
			+ " LEFT JOIN AUDITION ON APPLICANT.AUDITION_NO = AUDITION.AUDITION_NO WHERE APPLICANT.MEMBER_ID = #{member_id} AND AUDITION.AUDITION_END < CURDATE() ORDER BY AUDITION.AUDITION_END DESC")
	List<ApplicantDto> selectListSitEnd(String member_id);
	
	@Select(" SELECT AUDITION.AUDITION_NO, AUDITION.AUDITION_TITLE, AUDITION.AUDITION_END  FROM BOOKMARK "
			+ " LEFT JOIN AUDITION ON BOOKMARK.AUDITION_NO = AUDITION.AUDITION_NO WHERE BOOKMARK.MEMBER_ID = #{member_id} ORDER BY AUDITION.AUDITION_END DESC")
	List<BookmarkDto> selectListBookmark(String member_id);
	
	@Select(" SELECT * FROM AUDITION WHERE MEMBER_ID = #{member_id} AND AUDITION_END > CURDATE() ORDER BY AUDITION_END DESC ")
	List<AuditionDto> selectListSitIngCom(String member_id);
	
	@Select(" SELECT * FROM AUDITION WHERE MEMBER_ID = #{member_id} AND AUDITION_END < CURDATE() ORDER BY AUDITION_END DESC ")
	List<AuditionDto> selectListSitEndCom(String member_id);
	
	@Update(" UPDATE APPLICANT SET AUDITION_SITUATION = #{audition_situation} WHERE APPLICANT_NO = #{applicant_no} ")
	int sitChange(String audition_situation, int applicant_no);
	
	@Insert(" INSERT INTO BOOKMARK VALUES( NULL, #{audition_no}, #{member_id} ) ")
	int bookmark(BookmarkDto dto, String member_id, int audition_no);

}
