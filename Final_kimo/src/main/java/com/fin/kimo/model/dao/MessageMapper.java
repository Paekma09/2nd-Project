package com.fin.kimo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.fin.kimo.model.dto.MessageDto;

@Mapper
public interface MessageMapper {
	
	@Insert(" INSERT INTO MESSAGE VALUES( NULL,'메세지 내용을 입력하세요' , now(), TRUE, '메세지 제목을 입력하세요', '보낸사람', #{member_id} ) ")
	int insert(MessageDto dto,String member_id);
	
	@Select(" SELECT * FROM MESSAGE WHERE MEMBER_ID = #{member_id} AND MESSAGE_CONTENT = '메세지 내용을 입력하세요' ")
	MessageDto detail(String member_id);
	
	@Update(" UPDATE MESSAGE SET MESSAGE_CONTENT=#{message_content}, MESSAGE_DATE=now(), MESSAGE_TITLE=#{message_title}, MESSAGE_SEND= '임시' WHERE MESSAGE_NO=#{message_no} ")
	int update(MessageDto dto);
	
	@Update(" UPDATE MESSAGE SET MESSAGE_SEND=#{member_id} WHERE MESSAGE_SEND='임시' ")
	int updateId(MessageDto dto, String member_id);
	
	@Select(" SELECT * FROM MESSAGE WHERE MEMBER_ID=#{member_id} ORDER BY MESSAGE_DATE DESC ")
	List<MessageDto> list(String member_id);
	
	@Select(" SELECT * FROM MESSAGE WHERE MESSAGE_NO = #{message_no} ")
	MessageDto selectOne(int message_no);
	
	@Delete(" DELETE FROM MESSAGE WHERE MESSAGE_NO = #{message_no} ")
	int delete(int message_no);

	
	
	
	
	
	
}
