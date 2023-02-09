package com.fin.kimo.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.fin.kimo.model.biz.AuditionBiz;
import com.fin.kimo.model.dto.ApplicantDto;
import com.fin.kimo.model.dto.AuditionDto;
import com.fin.kimo.model.dto.AuditionTalentDto;
import com.fin.kimo.model.dto.BookmarkDto;

import ch.qos.logback.core.net.SyslogOutputStream;
@Controller
@RequestMapping("/audition")
public class AuditionController {
	
	@Autowired
	private AuditionBiz auditionBiz;
	
	@GetMapping("/list")
	public String auditionList(Model model) {
		model.addAttribute("list", auditionBiz.selectList());
		return "auditionList";
	}
	
	@GetMapping("/insertform")
	public String auditionInsert() {
		
		return "auditionInsert";
	}
	

	
	@PostMapping("/insert")
	public String insert(AuditionDto dto, AuditionTalentDto tdto, Principal principal) {
		String member_id = principal.getName();
		if(auditionBiz.insert(dto)>0 && auditionBiz.insert(tdto)>0) {
			auditionBiz.insertId(dto,member_id);
			return "redirect:/audition/list";
		}else {
			return "redirect:/audition/insertform";
		}
	}
	
	@PostMapping("/bookmark")
	public String bookmark(BookmarkDto dto, Principal principal,int audition_no) {
		System.out.println("북마크시작");
		String member_id = principal.getName();
		System.out.println(member_id);
		System.out.println(audition_no);
		auditionBiz.bookmark(dto,member_id,audition_no);
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookmarklist" , method=RequestMethod.POST)
	public List<BookmarkDto> bookmarklist(String type, Principal principal){
		String member_id = principal.getName();
		System.out.println(type);
		System.out.println(member_id);
		List<BookmarkDto> list = null;
		
		list = auditionBiz.selectListBookmark(member_id);
		
		
		return list;
	}
	
	
	@GetMapping("/detail")
	public String selectOne(Model model,int audition_no) {
		System.out.println(audition_no);
		model.addAttribute("dto",auditionBiz.selectOne(audition_no));
		model.addAttribute("dtot",auditionBiz.selectOneTalent(audition_no));
		return "auditionDetail";
	}
	
	@GetMapping("/updateform")
	public String updateForm(Model model, int audition_no) {
		model.addAttribute("dto",auditionBiz.selectOne(audition_no));
		return "auditionUpdate";
	}
	
	@PostMapping("/update")
	public String update(AuditionDto dto) {
		if(auditionBiz.update(dto)>0) {
			return "redirect:/audition/detail?audition_no="+dto.getAudition_no();
		}else {
			return "redirect:/audition/updateform?audition_no="+dto.getAudition_no();
		}
	}
	
	@GetMapping("/sitChange")
	public void sitChange(String audition_situation, int applicant_no) {
		System.out.println(audition_situation);
		System.out.println(applicant_no);
		auditionBiz.sitChange(audition_situation, applicant_no);

	}
	
//	@GetMapping("/sitChange")
//	public String sitChange(AuditionDto dto, String audition_situation, int applicant_no, String port_title) {
//		System.out.println(audition_situation);
//		System.out.println(applicant_no);
//		if(audition_situation == "프로필 확인") {
//			auditionBiz.sitChange(audition_situation, applicant_no);
//			return "redirect:/port/detail?port_title="+port_title;
//		}else {
//			auditionBiz.sitChange(audition_situation, applicant_no);
//			return "redirect:/comManagementform2?audition_no="+dto.getAudition_no();
//		}
//	}
	
	@GetMapping("/delete")
	public String delete(int audition_no) {
		if(auditionBiz.delete(audition_no)>0) {
			return "redirect:/audition/list";
		}else {
			return "redirect:/audition/detail?audition_no="+audition_no;
		}
	}
	
	@GetMapping("/applyform")
	public String applyform(Model model, int audition_no,Principal principal) {
		String artist = principal.getName();
		model.addAttribute("dto",auditionBiz.selectOne(audition_no));
		
		model.addAttribute("pdto",auditionBiz.portList(artist));
		
		return "auditionApply";
	}
	
	@PostMapping("/apply")
	public String apply(ApplicantDto dto, Principal principal) {
		String member_id = principal.getName();
		if(auditionBiz.apply(dto)>0) {
			auditionBiz.applyId(dto,member_id);
			return "redirect:/audition/list";
		}else {
			return "redirect:/audition/applyform";
		}
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/listEmp" , method=RequestMethod.POST)
	public List<AuditionDto> selectListEmp(String type){
		System.out.println(type);
		List<AuditionDto> list = null;
		if(type.equals("전체")) {
			list = auditionBiz.selectList();
		}else {
			list = auditionBiz.selectListEmp(type);
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/listJob" , method=RequestMethod.POST)
	public List<AuditionDto> selectListJob(String type){
		System.out.println(type);
		List<AuditionDto> list = null;
		if(type.equals("전체")) {
			list = auditionBiz.selectList();
		}else {
			list = auditionBiz.selectListJob(type);
		}		
		return list;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/listSit" , method=RequestMethod.POST)
	public List<ApplicantDto> selectListSit(String type, Principal principal){
		String member_id = principal.getName();
		System.out.println(type);
		System.out.println(member_id);
		List<ApplicantDto> list = null;
		if(type.equals("진행")) {
			list = auditionBiz.selectListSitIng(member_id);
		}else if(type.equals("마감")){
			list = auditionBiz.selectListSitEnd(member_id);
		}else{
			list = auditionBiz.artManagementform(member_id);
		}
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/listSitCom" , method=RequestMethod.POST)
	public List<AuditionDto> selectListSitCom(String type, Principal principal){
		String member_id = principal.getName();
		System.out.println(type);
		System.out.println(member_id);
		List<AuditionDto> list = null;
		if(type.equals("진행")) {
			list = auditionBiz.selectListSitIngCom(member_id);
		}else if(type.equals("마감")){
			list = auditionBiz.selectListSitEndCom(member_id);
		}else{
			list = auditionBiz.comManagementform(member_id);
		}
		
		return list;
	}
	
	@GetMapping("/artManagementform")
	public String artManagementform(Model model, Principal principal) {
	String member_id = principal.getName();
	System.out.println(member_id);
		model.addAttribute("list", auditionBiz.artManagementform(member_id));
		return "auditionManageArt";
	}

	
	@GetMapping("/comManagementform")
	public String comManagementform(Model model, Principal principal) {
		String member_id = principal.getName();
		System.out.println(member_id);
		model.addAttribute("list", auditionBiz.comManagementform(member_id));
		return "auditionManageCom";
	}
	
	@GetMapping("/comManagementform2")
	public String artManagementform(Model model, int audition_no) {
	System.out.println(audition_no);
		model.addAttribute("list", auditionBiz.comManagementform2(audition_no));
		model.addAttribute("list2", auditionBiz.comManagementform2name(audition_no));
		return "auditionManageCom2";
	}

	
	
	
	

	


	
	
}
