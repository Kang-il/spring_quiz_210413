package com.quiz.mybatis_select_quiz01.dao;

import org.springframework.stereotype.Repository;

import com.quiz.mybatis_select_quiz01.model.Realtor;

@Repository
public interface RealtorDAO {

	public void insertRealtor(Realtor realtor);
	
	public Realtor selectRealtorById(int id);
	
}
