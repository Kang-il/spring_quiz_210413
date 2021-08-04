package com.quiz.lesson08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson08.bo.FavoriteBO;
import com.quiz.lesson08.model.Favorite;

@RequestMapping("/lesson08")
@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/quiz01/add_favorite_view")
	public String addFavoriteView() {
		return "lesson08/addFavorite";
	}
	
	
	
	@RequestMapping("/quiz01/favorite_list_view")
	public String favoriteListView(Model model) {
		
		List<Favorite> favoriteList=favoriteBO.getFavoriteList();
		
		model.addAttribute("subject","즐겨찾기 목록");
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson08/favoriteListView";
	}
	

//	@PostMapping("/quiz01/add_favorite")
//	public String addFavorite(
//			@ModelAttribute Favorite favorite
//			) {
//		favoriteBo.addFavorite(favorite);
//		return "lesson08/favoriteListView";
//	}
	
	
	//AJAX요청이 왔을 때
	//서버쪽에 @ResponseBody 어노테이션 사용을 해야함
	//-리턴되는 값이 꼭 있어야 한다.
	@RequestMapping("/quiz01/add_favorite")
	@ResponseBody //없을 시 view를 찾으려고 한다.
	public Map<String, String> addFavorite(
			@RequestParam("name") String name
			,@RequestParam("url") String url
			){
		
		//DB Insert
		favoriteBO.addFavorite(name,url);
		
		//           ---------------DTO,model-------------
		// view  --> Controller --> Service --> Repository --> Mapper.xml
		
		// entity용객체 
		// view용으로 가공이 심하게 이루어질 경우 따로 view용으로 따로 만들어준다. -- 가공되기 시작하면 분리해 주는 것이 좋다. 
		
		//insert -->  parameterType Favorite(DTO , model , entity) DB테이블과 일치하는 객체 1:1맵핑 -- entity
		
		//select --> resultType FavoriteView -- 가공된 객체
		
		//성공여부 리턴
		//{"result" : "success"}
		//{"result" : "error"}
		//클라이언트와 규칙을정하여 리턴 할 것
		
		//상단 method 실행완료 후 밑의 코드가 실행된다 --> DB에 INSERT까지(favoriteBO.addFavorite(name,url);) Exception이 없었으므로 성공했다고 본다.
		Map<String,String> resultMap=new HashMap<String, String>();
		resultMap.put("result", "success");
		
		return resultMap;
	}
	
	@RequestMapping("/quiz01/is_duplication_favorite")
	@ResponseBody
	public Map<String,Boolean> isDuplicationFavorite(@RequestParam("url") String url){
		
		Favorite favorite=favoriteBO.getFavoriteByUrl(url);

		Map<String,Boolean> result=new HashMap<>();
		
		result.put("is_duplication",false);
		if(favorite!=null) {//값이 있다는 것
			result.put("is_duplication", true);
		}
		return result;
		
	}
	
	@RequestMapping("/quiz01/del_favorite")
	@ResponseBody
	public Map<String,Boolean> delFavorite(@RequestParam("id")int id){
		
		Map<String,Boolean> result=new HashMap<>();
		
		int check=favoriteBO.deleteFavoriteById(id);
		
		if(check==0) {
			result.put("result", false);
		}else {
			result.put("result", true);
		}
		
		return result;
	}
	
	
	
	
}
