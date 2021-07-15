package com.quiz.mybatis_quiz01.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.mybatis_quiz01.model.Store;

@Repository
public interface StoreDAO {
	public List<Store> selectStoreList();
}
