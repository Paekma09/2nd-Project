package com.fin.kimo.model.biz;

import java.util.List;

import com.fin.kimo.model.dto.ReviewCommentDto;
import com.fin.kimo.model.dto.ReviewDto;

import comfin.kimo.model.page.PagingVO;

public interface ReviewBiz {
	
	public List<ReviewDto>selectList();
	public ReviewDto selectOne(int review_no);
	public int insert(ReviewDto dto);
	public int update(ReviewDto dto);
	public int delete(int review_no);
	public int updateCount(int review_no);
	int insertComment(ReviewCommentDto dto);
	public List<ReviewCommentDto> selectCommentList(int review_no);
	int deleteAllComment(int reivew_no);
	public int countBoard();
	public List<ReviewDto> selectBoard(PagingVO pvo);
	int deleteComment(int comment_no);
	int commentCount(int review_no);
	
}
