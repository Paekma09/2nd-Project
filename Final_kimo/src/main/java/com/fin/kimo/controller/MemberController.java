package com.fin.kimo.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fin.kimo.model.biz.ConfirmMailBizImpl;
import com.fin.kimo.model.biz.MemberBiz;
import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.Talent;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private ConfirmMailBizImpl confirmMail;
	
	@RequestMapping("/signupform")
	public String singup() {
		return "signup";
	}
	
	@RequestMapping("/signup")
	public String insert(MemberDto dto, Talent talent) {
		System.out.println(dto);
		System.out.println(talent);
		
		// password 암호화
		dto.setMember_password(passwordEncoder.encode(dto.getMember_password()));
		logger.info(dto.getMember_password());
		
		int res1 = biz.insert(dto);
		int res2 = biz.insert(talent);
		
		if(res1==1 && res2==1) {
			return "redirect:/";
		}else {
			return "redirect:/member/signupform";
		}
	}
	
	// 아이디 중복체크
	@PostMapping("/checkid")
	 public ResponseEntity<?> checkId(@RequestBody String member_id) {
	    Optional<MemberDto> checkId = biz.checkId(member_id);
	    if (checkId.isPresent()) {
	    	logger.info("중복 : " + member_id);
	    	return ResponseEntity.ok("이미 사용중인 아이디입니다.");
	    } else {
	    	logger.info("사용가능 : " + member_id);
	    	return ResponseEntity.ok("멋진 아이디네요!");
	    }
	    
	  }
	
	// 휴대전화 중복체크
	@PostMapping("/checkphone")
	public ResponseEntity<?> checkPhone(@RequestBody String member_phone) {
		Optional<MemberDto> checkPhone = biz.checkPhone(member_phone);
		if (checkPhone.isPresent()) {
	    	logger.info("중복 : " + member_phone);
			return ResponseEntity.ok("이미 사용중인 번호입니다.");
		} else {
	    	logger.info("사용가능 : " + member_phone);
			return ResponseEntity.ok("");
		}
		
	}
	
	// 이메일 중복체크
	@PostMapping("/checkemail")
	public ResponseEntity<?> checkEmail(@RequestBody String member_email) {
//		logger.info("중복 : " + member_email);
		Optional<MemberDto> checkEmail = biz.checkEmail(member_email);
		if (checkEmail.isPresent()) {
	    	logger.info("중복 : " + member_email);
			return ResponseEntity.ok("이미 사용중인 이메일입니다.");
		} else {
	    	logger.info("사용가능 : " + member_email);
			return ResponseEntity.ok("");
		}
		
	}
	
	
	// 이메일 인증
	@PostMapping("/confirmMail")
	@ResponseBody
	String mailConfirm(@RequestParam("email") String email) throws Exception {

	   String code = confirmMail.sendSimpleMessage(email);
	   System.out.println("인증코드 : " + code);
	   return code;
	}
	
	@GetMapping("/login")
    public String login(HttpServletRequest request) {
        return "index";
    }
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
