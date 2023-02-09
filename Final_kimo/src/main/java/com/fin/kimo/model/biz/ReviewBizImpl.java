package com.fin.kimo.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.kimo.model.dao.ReviewMapper;
import com.fin.kimo.model.dto.ReviewCommentDto;
import com.fin.kimo.model.dto.ReviewDto;

import comfin.kimo.model.page.PagingVO;

@Service
public class ReviewBizImpl implements ReviewBiz{
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewDto> selectList() {
		return reviewMapper.selectList();
	}

	@Override
	public ReviewDto selectOne(int myno) {
		return reviewMapper.selectOne(myno);
	}

	@Override
	public int insert(ReviewDto dto) {
		return reviewMapper.insert(dto);
	}

	@Override
	public int update(ReviewDto dto) {
		return reviewMapper.update(dto);
	}

	@Override
	public int delete(int review_no) {
		return reviewMapper.delete(review_no);
	}
	
	@Override
	public int insertComment(ReviewCommentDto dto) {
		return reviewMapper.insertComment(dto);
	}

	@Override
	public List<ReviewCommentDto> selectCommentList(int review_no) {
		return reviewMapper.selectCommentList(review_no);
	}
	
	@Override
	public int updateCount(int review_no) {
		return reviewMapper.updateCount(review_no);
	}

	@Override
	public int deleteAllComment(int review_no) {
		return reviewMapper.deleteAllComment(review_no);
	}

	@Override
	public int countBoard() {
		return reviewMapper.countBoard();
	}

	@Override
	public List<ReviewDto> selectBoard(PagingVO pvo) {
		return reviewMapper.selectBoard(pvo);
	}
	
	@Override
	public int deleteComment(int review_no) {
		return reviewMapper.deleteComment(review_no);
	}

	@Override
	public int commentCount(int review_no) {
		return reviewMapper.commentCount(review_no);
	}
	
	


}
