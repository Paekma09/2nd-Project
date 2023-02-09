package com.fin.kimo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.fin.kimo.model.dto.EduDto;
import com.fin.kimo.model.dto.FilmoDto;
import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.PortfolioDto;
import com.fin.kimo.model.dto.Talent;

@Mapper
public interface PortfolioMapper {
	
	// 회원 정보
	@Select(" SELECT REPLACE(MEMBER_BIRTH, ',', '.') AS MEMBER_BIRTH, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_ADDR, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_TYPE, MEMBER_ADMIN, MEMBER_GENDER, MEMBER_TALL, MEMBER_KEYWORD, MEMBER_BODY FROM MEMBER WHERE MEMBER_ID = #{member_id} ")
	MemberDto selectMember(String member_id);
	
	@Select(" SELECT * FROM TALENT WHERE MEMBER_ID = #{member_id} ")
	Talent selectTalent(String member_id);
	
	//포폴 리스트 조회
	@Select(" SELECT * FROM PORTFOLIO WHERE MEMBER_ID = #{member_id} ORDER BY PORT_DATE DESC ")
	List<PortfolioDto> selectList(String member_id);
	
	//포폴 등록
	@Insert(" INSERT INTO PORTFOLIO VALUES(#{port_title}, #{port_essay}, now(), #{member_id}) ")
	int insertPort(PortfolioDto portDto);
	
//	@Insert(" INSERT INTO FILMO(FILMO_TITLE, FILMO_DIV, FILMO_IMP, FILMO_NAME, PORT_TITLE) "
//			+ "VALUES(#{filmo_title}, #{filmo_div}, #{filmo_imp}, #{filmo_name}, #{port_title}) ")
//	int insertFilmo(FilmoDto filmoDto);
//	
//	@Insert(" INSERT INTO EDU(EDU_FIRSTPERIOD, EDU_ENDPERIOD, EDU_SCHOOL, EDU_SCHOOLNAME, EDU_MAJOR, EDU_GRADUATED, PORT_TITLE) "
//			+ "VALUES(#{edu_firstPeriod}, #{edu_endPeriod}, #{edu_school}, #{edu_schoolName}, "
//			+ "#{edu_major}, #{edu_graduated}, #{port_title}) ")
//	int insertEdu(EduDto eduDto);
	
	// 등록할때 auto_increment가 되지만 id 값에 null을 넣는거
	@Insert(" INSERT INTO FILMO VALUES(NULL, #{filmo_title}, #{filmo_div}, #{filmo_imp}, #{filmo_name}, #{port_title}) ")
	int insertFilmo(FilmoDto filmoDto);
	
	@Insert(" INSERT INTO EDU VALUES(NULL, #{edu_firstPeriod}, #{edu_endPeriod}, #{edu_school}, #{edu_schoolName}, "
			+ "#{edu_major}, #{edu_graduated}, #{port_title}) ")
	int insertEdu(EduDto eduDto);
	
	@Select(" SELECT * FROM PORTFOLIO WHERE PORT_TITLE = #{port_title} ")
	PortfolioDto selectDetail(String port_title);
	
	@Select(" SELECT * FROM FILMO WHERE PORT_TITLE = #{port_title} ")
	List<FilmoDto> selectFilmo(String port_title);

	@Select(" SELECT * FROM EDU WHERE PORT_TITLE = #{port_title} ")
	List<EduDto> selectEdu(String port_title);

	//수정
//	@Update(" UPDATE PORTFOLIO SET PORT_TITLE=#{port_title}, PORT_ESSAY=#{port_essay} WHERE MEMBER_ID=#{member_id} ")
	@Update(" UPDATE PORTFOLIO SET PORT_ESSAY=#{port_essay} WHERE PORT_TITLE=#{port_title} ")
	int updatePort(PortfolioDto portDto);

	@Update(" UPDATE FILMO SET FILMO_TITLE=#{filmo_title}, FILMO_DIV=#{filmo_div}, FILMO_IMP=#{filmo_imp} ,"
			+ "FILMO_NAME=#{filmo_name} WHERE FILMO_ID=#{filmo_id} ")
	int updateFilmo(FilmoDto filmoDto);

	@Update(" UPDATE EDU SET EDU_FIRSTPERIOD=#{edu_firstPeriod}, EDU_ENDPERIOD=#{edu_endPeriod}, EDU_SCHOOL=#{edu_school},"
			+ "EDU_SCHOOLNAME=#{edu_schoolName}, EDU_MAJOR=#{edu_major}, EDU_GRADUATED=#{edu_graduated} WHERE EDU_ID=#{edu_id} ")
	int updateEdu(EduDto eduDto);

	//삭제
	@Delete(" DELETE FROM FILMO WHERE PORT_TITLE=#{port_title} ")
	int deleteFilmo(String port_title);

	@Delete(" DELETE FROM EDU WHERE PORT_TITLE=#{port_title} ")
	int deleteEdu(String port_title);

	@Delete(" DELETE FROM PORTFOLIO WHERE PORT_TITLE=#{port_title} ")
	int deletePort(String port_title);
	

}
