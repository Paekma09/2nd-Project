package com.fin.kimo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fin.kimo.model.biz.PaidServiceBiz;
import com.fin.kimo.model.biz.StatisticsBiz;

@Controller
@RequestMapping("/Statisticsboard")
public class StatisticsController {

	@Autowired
	StatisticsBiz statisticsBiz;

	@Autowired
	PaidServiceBiz paidServiceBiz;

	@GetMapping("/list")
	public String selectList(Model model, HttpServletRequest request, Principal principal) {
		HttpSession session = request.getSession();

		model.addAttribute("list", statisticsBiz.selectTallList());
		model.addAttribute("list2", statisticsBiz.selectBodyList());
		
//		 model.addAttribute("paidService", paidServiceBiz.selectPaidService(session.getAttribute("member_id").toString()));
		String member_id = principal.getName();
		System.out.println(member_id);
		
//		String id = session.getAttribute("member_id").toString();
		System.out.println(paidServiceBiz.selectPaidService(member_id));
		model.addAttribute("paidService", paidServiceBiz.selectPaidService(member_id));

		System.out.println(statisticsBiz.selectBodyList());
		return "Statisticslist";
	}

}
