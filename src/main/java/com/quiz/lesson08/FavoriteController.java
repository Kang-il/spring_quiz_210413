package com.quiz.lesson08;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson08.bo.FavoriteBO;
import com.quiz.lesson08.model.Favorite;

@RequestMapping("/lesson08")
@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteBO favoriteBo;
	
	@RequestMapping("/quiz01/add_favorite_view")
	public String addFavoriteView() {
		return "lesson08/addFavorite";
	}
	
	
	
	@RequestMapping("/quiz01/favorite_list_view")
	public String favoriteListView(Model model) {
		
		List<Favorite> favoriteList=favoriteBo.getFavoriteList();
		
		model.addAttribute("subject","즐겨찾기 목록");
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson08/favoriteListView";
	}
	
	
	
	
	@PostMapping("/quiz01/add_favorite")
	public String addFavorite(
			@ModelAttribute Favorite favorite
			) {
		favoriteBo.addFavorite(favorite);
		return "lesson08/favoriteListView";
	}
	
	
	
}
