package com.fin.kimo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.Talent;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@RequestMapping("/main")
	public String mypage() {
		return "thymeleaf/mypage";
	}
}
