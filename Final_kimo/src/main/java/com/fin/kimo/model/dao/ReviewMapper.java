package com.fin.kimo.model.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.fin.kimo.model.dto.ReviewCommentDto;
import com.fin.kimo.model.dto.ReviewDto;

import comfin.kimo.model.page.PagingVO;


@Mapper
public interface ReviewMapper {
	
	@Select("SELECT * FROM `REVIEW` ORDER BY REVIEW_NO DESC")
	List<ReviewDto>selectList();
	
	@Insert("INSERT INTO `REVIEW`(review_title, review_date, review_path, review_readcount, member_id, review_content) VALUES(#{review_title},now(),#{review_path},0,#{member_id},#{review_content})")
	int insert(ReviewDto dto);
	
	@Select("SELECT*FROM `REVIEW` WHERE REVIEW_NO=#{review_no}")
	ReviewDto selectOne(int review_no);
	
	@Update("UPDATE `REVIEW` SET REVIEW_TITLE=#{review_title}, REVIEW_PATH=#{review_path}, REVIEW_CONTENT=#{review_content} WHERE REVIEW_NO=#{review_no}")
	int update(ReviewDto dto);
	
	@Delete("DELETE FROM `REVIEW` WHERE REVIEW_NO=#{review_no}")
	int delete(int review_no);
	
	@Insert(" INSERT INTO REVIEW_COMMENT ( review_no, comment_detail, comment_date, member_id) VALUES( #{review_no}, #{comment_detail}, NOW(), #{member_id}) ")
	int insertComment(ReviewCommentDto dto);
	
	@Select("select COMMENT_NO, REVIEW_NO, COMMENT_DETAIL, COMMENT_DATE ,  M.MEMBER_NAME FROM REVIEW_COMMENT C LEFT JOIN MEMBER M ON C.MEMBER_ID = M.MEMBER_ID where review_no=#{review_no} order by COMMENT_DATE asc")
	List<ReviewCommentDto>selectCommentList(int Review_no);
	
	@Update("update REVIEW set REVIEW_READCOUNT = REVIEW_READCOUNT + 1 where REVIEW_NO = #{review_no}")
	int updateCount(int review_no);
	
	@Delete("DELETE FROM `REVIEW_COMMENT` WHERE REVIEW_NO=#{review_no}")
	int deleteAllComment(int review_no);
	
	@Select("SELECT COUNT(*) FROM REVIEW")
	int countBoard();
	
	@Select("SELECT B.* \r\n"
			+ "		FROM (\r\n"
			+ "			SELECT @rownum := @rownum + 1 RN, A.* \r\n"
			+ "				FROM (\r\n"
			+ "						SELECT h.* \r\n"
			+ "						FROM REVIEW h, (select @rownum := 0) r\r\n"
			+ "						ORDER BY h.REVIEW_NO DESC \r\n"
			+ "						) A\r\n"
			+ "				) B\r\n"
			+ "	WHERE B.RN BETWEEN #{start} AND #{end}")
	List<ReviewDto>selectBoard(PagingVO pvo);

	
	@Delete("DELETE FROM `REVIEW_COMMENT` WHERE COMMENT_NO=#{comment_no}")
	int deleteComment(int comment_no);
	
	@Select( " SELECT COUNT(*) FROM REVIEW_COMMENT WHERE REVIEW_NO=#{review_no} ")
	int commentCount(int review_no);
	
}
