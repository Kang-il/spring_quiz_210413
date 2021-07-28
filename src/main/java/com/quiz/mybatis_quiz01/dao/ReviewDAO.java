package com.quiz.mybatis_quiz01.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.mybatis_quiz01.model.Review;

@Repository
public interface ReviewDAO {
	public List<Review> selectReviewListByStoreId(int storeId);

}
