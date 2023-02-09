package com.fin.kimo.model.biz;

import java.util.List;


import com.fin.kimo.model.dto.MessageDto;

public interface MessageBiz {

	
	
	public int insert(MessageDto dto, String member_id);
	public MessageDto detail(String memeber_id);
	public int update(MessageDto dto);
	public int updateId(MessageDto dto, String member_id);
	public List<MessageDto> list(String member_id);
	public MessageDto selectOne(int message_no);
	public int delete(int message_no);
	
	
	
	
	

	
	

}
