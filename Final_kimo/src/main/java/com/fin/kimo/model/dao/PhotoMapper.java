package com.fin.kimo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import com.fin.kimo.model.dto.PhotoDto;
import com.fin.kimo.model.dto.PortfolioDto;
import com.fin.kimo.model.dto.ReviewDto;

@Mapper
public interface PhotoMapper {
	
	//기존꺼
	@Insert(" INSERT INTO PHOTO(photo_orgName, photo_saveName, photo_path, port_title) "
			+ "VALUES(#{photo_orgName}, #{photo_saveName}, #{photo_path}, #{port_title}) ")
	int insert(PhotoDto photo);

	@Select("SELECT * FROM PHOTO WHERE PORT_TITLE = #{port_title} ORDER BY PHOTO_NO DESC")
	List<PhotoDto>selectPhoto(String port_title);

	@Select(" SELECT * FROM PHOTO WHERE PHOTO_NO = #{photo_no} ")
	PhotoDto selectNo(int photo_no);

	@Delete(" DELETE FROM PHOTO WHERE PORT_TITLE=#{port_title} ")
	int deletePhoto(String port_title);
}
