package com.fin.kimo.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fin.kimo.model.biz.ReviewBiz;
import com.fin.kimo.model.dto.ReviewCommentDto;
import com.fin.kimo.model.dto.ReviewDto;

import comfin.kimo.model.page.PagingVO;

@Controller
@RequestMapping("/Reviewboard")
public class ReviewController {
	
	@Autowired
	private ReviewBiz reviewBiz;
	
	/*
	@GetMapping("/list")
	public String selectList(Model model) {
		model.addAttribute("list", highlightBiz.selectList());
		return "Highlightboardlist";
	}
	*/
	
	@GetMapping("/insertform")
	public String insertForm() {
		return "Reviewinsert";
	}
	
	@PostMapping("/insert")
	public String insert(ReviewDto dto, Principal principal) {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		
		//dto.setMember_id("안소진");
		if(reviewBiz.insert(dto)>0) {
			return"redirect:/Reviewboard/list";
		}else {
				return "redirect:/Reviewboard/insertform";
		}
		
	
	}
	
	@GetMapping("/detail")
	public String selectOne(Model model, int review_no) {
		reviewBiz.updateCount(review_no);
		model.addAttribute("dto",reviewBiz.selectOne(review_no));
		model.addAttribute("coList", reviewBiz.selectCommentList(review_no) );
		System.out.println(review_no);
		return "Reviewdetail";
	}
	
	@GetMapping("/updateform")
	public String updateform(Model model,int review_no) {
		model.addAttribute("dto",reviewBiz.selectOne(review_no));
		return"Reviewupdate";
	}
	
	@PostMapping("/update")
	public String update(ReviewDto dto) {
		if(reviewBiz.update(dto)>0) {
			return "redirect:/Reviewboard/detail?review_no="+dto.getReview_no();
		}else {
			return "redirect:/Reviewboard/updateform?review_no="+dto.getReview_no();
		}
	}
	
	@GetMapping("/delete")
	public String delete(int review_no) {
		
		reviewBiz.deleteAllComment(review_no);
		
		if(reviewBiz.delete(review_no)>0) {
			return"redirect:/Reviewboard/list";
			
		}else {
			return"redirect:/Reviewboard/detail?review_no="+review_no;
		}
	}
	
	@GetMapping("/list2")
	public String selectList2() {
		return "list";
	}
	
	@PostMapping("/insertcomment")
	public String insertComment(ReviewCommentDto dto, Principal principal) {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		System.out.println("insertcomment");
		//dto.setMember_id("hoy0920");
		if(reviewBiz.insertComment(dto)>0) {
			return "redirect:/Reviewboard/detail?review_no=" + dto.getReview_no();
		}else {
			System.out.println("댓글작성실패");
			return "redirect:/Reviewboard/detail?review_no=" + dto.getReview_no();
		}
		
	}
	
	@GetMapping("/list")
	public String selectList(HttpSession session, PagingVO pvo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		// !!!!!!!!!!!!!!!! 로그인 기능 연동후 삭제할 코드
//		session.setAttribute("login", "admin");
//		session.setAttribute("login", new MemberDto("sojin@naver.com","1234","애기"));
		
		int total = reviewBiz.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "7";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "7";
		}
		pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", pvo);
		List<ReviewDto> list = reviewBiz.selectBoard(pvo);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setommentcount(reviewBiz.commentCount(list.get(i).getReview_no()));
		}
		model.addAttribute("list",list);
		return "Reviewlist";
	}
	
	@GetMapping("/deletecomment")
	public String deleteComment(int comment_no, int review_no) {
		System.out.println(comment_no + ": " + review_no);
		if(reviewBiz.deleteComment(comment_no)>0) {
			return"redirect:/Reviewboard/detail?review_no="+review_no;
		}else {
			return"redirect:/Reviewboard/detail?review_no="+review_no;
		}
	}

}
