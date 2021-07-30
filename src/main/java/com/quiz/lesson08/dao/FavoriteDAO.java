package com.quiz.lesson08.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson08.model.Favorite;

@Repository
public interface FavoriteDAO {
	public void insertFavorite(Favorite favorite);
	public List<Favorite> selectFavoriteList();
}
