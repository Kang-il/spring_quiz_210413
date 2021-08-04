package com.quiz.lesson08.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson08.model.Favorite;

@Repository
public interface FavoriteDAO {
	public void insertFavorite(@Param("name") String name, @Param("url") String url);
	public List<Favorite> selectFavoriteList();
	public int deleteFavoriteById(int id);
	public Favorite selectFavoriteByUrl(String url);
}
