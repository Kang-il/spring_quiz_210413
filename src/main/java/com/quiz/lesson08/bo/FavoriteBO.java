package com.quiz.lesson08.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson08.dao.FavoriteDAO;
import com.quiz.lesson08.model.Favorite;

@Service
public class FavoriteBO {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	
//	public void addFavorite(Favorite favorite) {
//		favoriteDAO.insertFavorite(favorite);
//	}
//	
	public void addFavorite(String name,String url) {
		favoriteDAO.insertFavorite(name,url);
	}
	
	public List<Favorite> getFavoriteList(){
		return favoriteDAO.selectFavoriteList();
	}
	
	public int deleteFavoriteById(int id) {
		return favoriteDAO.deleteFavoriteById(id);
	}
	
	public Favorite getFavoriteByUrl(String url) {
		return favoriteDAO.selectFavoriteByUrl(url);
	}
}
