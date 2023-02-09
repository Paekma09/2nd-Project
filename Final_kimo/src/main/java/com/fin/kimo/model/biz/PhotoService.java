package com.fin.kimo.model.biz;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fin.kimo.model.dao.PhotoMapper;
import com.fin.kimo.model.dto.MemberDto;
import com.fin.kimo.model.dto.PhotoDto;
import com.fin.kimo.model.dto.PortfolioDto;
import com.fin.kimo.model.dto.ReviewDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//@Slf4j
//@RequiredArgsConstructor
@Service
public class PhotoService {
	
	@Value("${file.dir}")
	private String fileDir;
	
	@Autowired
	private PhotoMapper photoMapper;
	
	public int saveFile(MultipartFile files, PortfolioDto portDto) throws IOException {
		if(files.isEmpty()) {
			return 0;
		}
		//원래 파일 이름 추출
		String orgName = files.getOriginalFilename();
		
		//파일 이름으로 쓸 uuid 생성
		String uuid = UUID.randomUUID().toString();
		
		//확장자 추출(ex : .png)
		String extension = orgName.substring(orgName.lastIndexOf("."));
		
		//uuid와 확장자 결합
		String savedName = uuid + extension;
		
		//파일을 불러올 떄 사용할 파일 경로
		String savedPath = fileDir + savedName;
		
		//포폴 타이틀 설정
		String portTitle = portDto.getPort_title();
		
		//포토 엔티티 생성(롬복 사용)
//		PhotoDto photo = PhotoDto.builder()
//				.photo_orgName(orgName)
//				.photo_saveName(savedName)
//				.photo_path(savedPath)
//				.port_title(portTitle)
//				.build();
		
		PhotoDto photo = new PhotoDto();
		photo.setPhoto_orgName(orgName);
		photo.setPhoto_saveName(savedName);
		photo.setPhoto_path(savedPath);
		photo.setPort_title(portTitle);
		
//		log.info(savedPath);
		//실제로 로컬에 uuid를 파일명으로 저장
		files.transferTo(new File(savedPath));
		
		//데이터베이스에 파일 정보 저장
		int savePhoto = photoMapper.insert(photo);
		System.out.println("photo : " + photo);
		
			
		return savePhoto;
	}
	
	
	public List<PhotoDto> selectPhoto(String port_title) {
		return photoMapper.selectPhoto(port_title);
	}

	public Optional<PhotoDto> selectNo(int photo_no) {
		PhotoDto selectPhoto = photoMapper.selectNo(photo_no);
		return Optional.ofNullable(selectPhoto);
	}


	//삭제
	public int delete(String port_title) {
		return photoMapper.deletePhoto(port_title);
	}
	
	
}