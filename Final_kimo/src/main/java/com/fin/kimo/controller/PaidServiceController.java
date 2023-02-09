package com.fin.kimo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fin.kimo.model.biz.PaidServiceBiz;
import com.fin.kimo.model.dto.PaidServiceDto;

@Controller
@RequestMapping("/PaidServiceboard")
public class PaidServiceController {

	@Autowired
	PaidServiceBiz paidServiceBiz;

	@GetMapping("/list")
	public String selectList(Model model) {
		model.addAttribute("list", paidServiceBiz.selectPaidServiceList());
		return "PaidServicelist";
	}

	@GetMapping("/popup")
	public String popup(Model model, HttpServletRequest request) {

		return "PaidServicePopup";
	}

	@PostMapping("/payment")
	public String insertPaidService(HttpServletRequest request, Principal principal) {
//		 String member_id = request.getSession().getAttribute("member_id").toString();
		String member_id = principal.getName();
		PaidServiceDto dto = new PaidServiceDto();
		//
		dto.setMember_id(member_id);
		dto.setService_method("계좌이체");
		dto.setService_title("통계");
		paidServiceBiz.insertPaidService(dto);
		System.out.println("얍");
		return "PaidServiceClose";
	}


	@GetMapping("/popup2")
	public String popup2(Model model) {

		return "PaidServicePopup2";
	}

	// ex
	@GetMapping("/popup3")
	public String popup3(HttpServletRequest request) {


		return "PaidServicePopup3";
	}
	@PostMapping("/paymentkakao")
	public String insertPaidService2(HttpServletRequest request, Principal principal) {
//		 String member_id = request.getSession().getAttribute("member_id").toString();

		String member_id = principal.getName();
		PaidServiceDto dto = new PaidServiceDto();
		//
		dto.setMember_id(member_id);
		dto.setService_method("카카오페이");
		dto.setService_title("통계");
		paidServiceBiz.insertPaidService2(dto);
		System.out.println("얍");
		return "PaidServiceClose";
	}
}
