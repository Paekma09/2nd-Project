package com.fin.kimo.model.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.kimo.model.dao.MessageMapper;
import com.fin.kimo.model.dto.MessageDto;

@Service
public class MessageBizImpl implements MessageBiz{
	
	@Autowired
	private MessageMapper messageMapper;

	@Override
	public int insert(MessageDto dto, String member_id) {
		return messageMapper.insert(dto, member_id);
	}

	@Override
	public MessageDto detail(String member_id) {
		return messageMapper.detail(member_id);
	}
	
	@Override
	public int update(MessageDto dto) {
		return messageMapper.update(dto);
	}
	
	@Override
	public int updateId(MessageDto dto, String member_id) {
		return messageMapper.updateId(dto, member_id);
	}
	
	@Override
	public List<MessageDto> list(String member_id) {
		return messageMapper.list(member_id);
	}
	
	@Override
	public MessageDto selectOne(int message_no) {
		return messageMapper.selectOne(message_no);
	}
	
	@Override
	public int delete(int message_no) {
		return messageMapper.delete(message_no);
	}
	
	
}
