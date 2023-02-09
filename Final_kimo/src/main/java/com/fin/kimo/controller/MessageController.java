package com.fin.kimo.controller;

import java.security.Principal;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fin.kimo.model.biz.MessageBiz;
import com.fin.kimo.model.dto.MessageDto;


@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageBiz messageBiz;
	
	
	
	@GetMapping("/sendform")
	public String messageSendform(MessageDto dto,String member_id,Model model) {
		System.out.println("잉?");
		messageBiz.insert(dto, member_id);
		messageBiz.detail(member_id);
		model.addAttribute("dto",messageBiz.detail(member_id));
		
		return "MessageSendform";
	}
	
	@GetMapping("/send")
	public String messageSend(MessageDto dto,Principal principal) {
		String member_id = principal.getName();
		System.out.println(member_id);
		if(messageBiz.update(dto) >0 ) {
			messageBiz.updateId(dto,member_id);
			return "redirect:/message/box?";
		}else {
			return "redirect:/message/sendform?="+dto.getMember_id();
		}
	}
	
	@GetMapping("/box")
	public String messageBox(Model model,Principal principal) {
		String member_id = principal.getName();
		System.out.println(member_id);
		model.addAttribute("list",messageBiz.list(member_id));
		return "MessageBox";
	}
	
	@GetMapping("/detail")
	public String messageDetail(Model model,int message_no) {
		model.addAttribute("dto",messageBiz.selectOne(message_no));
		return "MessageDetail";
	}
	
	@GetMapping("/delete")
	public String delete(int message_no) {
		if(messageBiz.delete(message_no)>0) {
			return "redirect:/message/box";
		}else {
			return "redirect:/message/detail?audition_no="+message_no;
		}
	}
	
	
	
	
	
	
}
