package com.fin.kimo.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fin.kimo.model.biz.MemberBizImpl;
import com.fin.kimo.model.biz.PhotoService;
import com.fin.kimo.model.biz.PortfolioBiz;
import com.fin.kimo.model.biz.UserRepository;
import com.fin.kimo.model.dao.PhotoMapper;
import com.fin.kimo.model.dto.EduDto;
import com.fin.kimo.model.dto.FilmoDto;
import com.fin.kimo.model.dto.Member;
import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.PhotoDto;
import com.fin.kimo.model.dto.PortfolioDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//@RequiredArgsConstructor
@Controller
@RequestMapping("/port")
public class PortfolioController {
	
	@Value("${file.dir}")
	private String fileDir;
	
//	롬복 사용시 가능
//	@Autowired
//	private final PortfolioBiz biz;
//	
//	private final PhotoService photoService;
	
	@Autowired
	private PortfolioBiz biz;
	
	@Autowired
	private PhotoService photoService;
	
	//포트폴리오 리스트
	@GetMapping("/list")
	public String portfolioList(Model model, Principal principal) {
		String member_id = principal.getName();
		model.addAttribute("list",biz.selectList(member_id));
		
		return "thymeleaf/portfolioList";
	}
	
	//포트폴리오 등록화면
	@GetMapping("/insertform")
	public String insertForm(Model model, Principal principal) {
		String member_id = principal.getName();
		model.addAttribute("member",biz.selectMember(member_id));
		
		return "thymeleaf/portfolioInsert";
	}
	
	@PostMapping("/insert")
	public String portInsert(PortfolioDto portDto, FilmoDto filmoDto, EduDto eduDto,
			@RequestParam("photo") MultipartFile[] files) throws IOException {
		List<FilmoDto> filmoList = new ArrayList<FilmoDto>();
	    String[] filmoTitles = Optional.ofNullable(filmoDto.getFilmo_title()).orElse("").split(",");
	    String[] filmoDivs = Optional.ofNullable(filmoDto.getFilmo_div()).orElse("").split(",");
	    String[] filmoImps = Optional.ofNullable(filmoDto.getFilmo_imp()).orElse("").split(",");
	    String[] filmoNames = Optional.ofNullable(filmoDto.getFilmo_name()).orElse("").split(",");
	    
	    for(int i=0; i<filmoTitles.length; i++) {
	        FilmoDto filmo = new FilmoDto();
	        filmo.setFilmo_title(filmoTitles[i]);
	        filmo.setFilmo_div(filmoDivs[i]);
	        filmo.setFilmo_imp(filmoImps[i]);
	        filmo.setFilmo_name(filmoNames[i]);
	        filmo.setPort_title(portDto.getPort_title());
	        filmoList.add(filmo);
	    }
	    
	    List<EduDto> eduList = new ArrayList<EduDto>();
	    String[] firstPeriod = Optional.ofNullable(eduDto.getEdu_firstPeriod()).orElse("").split(",");
	    String[] endPeriod = Optional.ofNullable(eduDto.getEdu_endPeriod()).orElse("").split(",");
	    String[] school = Optional.ofNullable(eduDto.getEdu_school()).orElse("").split(",");
	    String[] schoolName = Optional.ofNullable(eduDto.getEdu_schoolName()).orElse("").split(",");
	    String[] major = Optional.ofNullable(eduDto.getEdu_major()).orElse("").split(",");
	    String[] graduated = Optional.ofNullable(eduDto.getEdu_graduated()).orElse("").split(",");
	    
	    for(int i=0; i<firstPeriod.length; i++) {
	    	EduDto edu = new EduDto();
	    	edu.setEdu_firstPeriod(firstPeriod[i]);
	    	edu.setEdu_endPeriod(endPeriod[i]);
	    	edu.setEdu_school(school[i]);
	    	edu.setEdu_schoolName(schoolName[i]);
	    	edu.setEdu_major(major[i]);
	    	edu.setEdu_graduated(graduated[i]);
	    	edu.setPort_title(portDto.getPort_title());
	    	eduList.add(edu);
	    }
	    
	    // 포폴 등록
	    int res1 = biz.insertPort(portDto);
	    int res2 = biz.insertFilmo(filmoList);
	    int res4 = biz.insertEdu(eduList);
		
		// 사진 업로드
		int res3 = 0;
		for(MultipartFile file : files) {
			res3 += photoService.saveFile(file, portDto); 
		}
		
		
		if(res1>0 && res2>0 || res3>0 || res4>0) {
			return "redirect:list";
		}else {
			return "redirect:insertform";
		}
	}
	
	//포트폴리오 디테일
	@GetMapping("/detail")
	public String portDetail(Model model, Principal principal, String port_title) {
		String member_id = principal.getName();
		model.addAttribute("member", biz.selectMember(member_id));
		model.addAttribute("talent", biz.selectTalent(member_id));
		
		model.addAttribute("port", biz.selectDetail(port_title));
		
		return "thymeleaf/portfolioInfo";
	}
	
	//ajax 사진 전환
	@PostMapping("/view")
	public String viewPhoto(Model model, String port_title) {
		List<PhotoDto> files = photoService.selectPhoto(port_title);
		model.addAttribute("all", files);
		
		return "thymeleaf/portfolioPhotoView";
	}

	//이미지 출력
	@GetMapping("/images/{fileId}")
	@ResponseBody
	public UrlResource downloadImage(@PathVariable("fileId") int photo_no, Model model) throws MalformedURLException {
		PhotoDto file = photoService.selectNo(photo_no).orElse(null);
		
		return new UrlResource("file:" + file.getPhoto_path());
	}
	
	//ajax 상세정보 전환
	@PostMapping("/moreInfo")
	public String moreInfo(Model model, String port_title) {
		model.addAttribute("port", biz.selectDetail(port_title));
		model.addAttribute("filmo",biz.selectFilmo(port_title));
		model.addAttribute("edu", biz.selectEdu(port_title));
		
		return "thymeleaf/portfolioMoreInfo";
	}
	
	//ajax 프로필 전환
	@PostMapping("/profile")
	public String profile(Model model, Principal principal, String port_title) {
		String member_id = principal.getName();
		model.addAttribute("member", biz.selectMember(member_id));
		model.addAttribute("talent", biz.selectTalent(member_id));
		
		model.addAttribute("port", biz.selectDetail(port_title));
		
		return "thymeleaf/portfolioProfile";
	}
	
	@GetMapping("/updateform")
	public String updateForm(Model model, Principal principal, String port_title) {
		String member_id = principal.getName();
		model.addAttribute("member", biz.selectMember(member_id));
		model.addAttribute("talent", biz.selectTalent(member_id));
		
		model.addAttribute("port", biz.selectDetail(port_title));
		model.addAttribute("filmo",biz.selectFilmo(port_title));
		model.addAttribute("edu", biz.selectEdu(port_title));
		
		//사진
		List<PhotoDto> files = photoService.selectPhoto(port_title);
		model.addAttribute("photo", files);
		
		return "thymeleaf/portfolioUpdate";
	}
	
	@PostMapping("/update")
	public String update(HttpServletRequest request, Model model, PortfolioDto portDto, FilmoDto filmoDto, EduDto eduDto, Principal principal,
			String port_title, @RequestParam("photo") MultipartFile[] files, RedirectAttributes redirectAttributes) throws IOException {
		
		String[] filmoIds = request.getParameterValues("filmo_id");
		String[] eduIds = request.getParameterValues("edu_id");
		
		List<FilmoDto> filmoList = new ArrayList<FilmoDto>();
	    String[] filmoTitles = Optional.ofNullable(filmoDto.getFilmo_title()).orElse("").split(",");
	    String[] filmoDivs = Optional.ofNullable(filmoDto.getFilmo_div()).orElse("").split(",");
	    String[] filmoImps = Optional.ofNullable(filmoDto.getFilmo_imp()).orElse("").split(",");
	    String[] filmoNames = Optional.ofNullable(filmoDto.getFilmo_name()).orElse("").split(",");
	    
	    for(int i=0; i<filmoTitles.length; i++) {
	        FilmoDto filmo = new FilmoDto();
	        filmo.setFilmo_id(Integer.parseInt(filmoIds[i]));
	        filmo.setFilmo_title(filmoTitles[i]);
	        filmo.setFilmo_div(filmoDivs[i]);
	        filmo.setFilmo_imp(filmoImps[i]);
	        filmo.setFilmo_name(filmoNames[i]);
	        filmo.setPort_title(portDto.getPort_title());
	        filmoList.add(filmo);
	    }
	    
	    List<EduDto> eduList = new ArrayList<EduDto>();
	    String[] firstPeriod = Optional.ofNullable(eduDto.getEdu_firstPeriod()).orElse("").split(",");
	    String[] endPeriod = Optional.ofNullable(eduDto.getEdu_endPeriod()).orElse("").split(",");
	    String[] school = Optional.ofNullable(eduDto.getEdu_school()).orElse("").split(",");
	    String[] schoolName = Optional.ofNullable(eduDto.getEdu_schoolName()).orElse("").split(",");
	    String[] major = Optional.ofNullable(eduDto.getEdu_major()).orElse("").split(",");
	    String[] graduated = Optional.ofNullable(eduDto.getEdu_graduated()).orElse("").split(",");
	    
	    for(int i=0; i<firstPeriod.length; i++) {
	    	EduDto edu = new EduDto();
	    	edu.setEdu_id(Integer.parseInt(eduIds[i]));
	    	edu.setEdu_firstPeriod(firstPeriod[i]);
	    	edu.setEdu_endPeriod(endPeriod[i]);
	    	edu.setEdu_school(school[i]);
	    	edu.setEdu_schoolName(schoolName[i]);
	    	edu.setEdu_major(major[i]);
	    	edu.setEdu_graduated(graduated[i]);
	    	edu.setPort_title(portDto.getPort_title());
	    	eduList.add(edu);
	    }
	    
	    // 포폴 수정
	    int res1 = biz.updatePort(portDto);
	    int res2 = biz.updateFilmo(filmoList);
	    int res4 = biz.updateEdu(eduList);
	    
		// 사진 업로드
		int res3 = 0;
		for(MultipartFile file : files) {
			res3 += photoService.saveFile(file, portDto); 
		}
		
		String member_id = principal.getName();
		model.addAttribute("member", biz.selectMember(member_id));
		model.addAttribute("talent", biz.selectTalent(member_id));
		model.addAttribute("port", biz.selectDetail(port_title));
		
		redirectAttributes.addAttribute("portTitle", biz.selectDetail(port_title).getPort_title());
		
		if(res1>0 || res2>0 || res4>0) {
			return "redirect:/port/detail?port_title={portTitle}";
		}else {
			return "redirect:/port/updateform?port_title={portTitle}";
		}
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(String port_title, Model model, Principal principal) {
		String member_id = principal.getName();
		model.addAttribute("list",biz.selectList(member_id));
		
		int res2 = biz.deleteFilmo(port_title);
		int res3 = biz.deleteEdu(port_title);
		int res4 = photoService.delete(port_title);
		int res1 = biz.deletePort(port_title);
		
		if(res1>0 || res2>0 || res3>0) {
			return "redirect:/port/list";
		}else {
			return "redirect:/port/detail?port_title={portTitle}";
		}
	}
	
	
	
	
	
	
	
	
}