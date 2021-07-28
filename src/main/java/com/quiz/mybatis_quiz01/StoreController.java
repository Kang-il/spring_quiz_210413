package com.quiz.mybatis_quiz01;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.mybatis_quiz01.bo.ReviewBO;
import com.quiz.mybatis_quiz01.bo.StoreBO;
import com.quiz.mybatis_quiz01.model.Review;
import com.quiz.mybatis_quiz01.model.Store;

@Controller
@RequestMapping("/lesson07")
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@RequestMapping("/quiz02/store_list")
	public String viewStoreList(Model model) {
		Date date =new Date();
		
		
		List<Store> storeList= storeBO.getStoreList();
		//DB에서 받아온 가게리스트
		model.addAttribute("storeList", storeList);
		//타이틀
		model.addAttribute("subject","우리동네 가게");
		//시간을 가져와 css주소에 추가해 새로고침시 업데이트 지연되는 일이 없도록
		model.addAttribute("currentTime", date.getTime());
		///section에 띄울 아이템을 식별하기위한 값 null == 02_section_storeList.jsp
		model.addAttribute("item",null);
		
		return "lesson07/00_template";
	}
	
	@RequestMapping("/quiz02/select_store")
	public String viewReview(
			Model model
			,@RequestParam(value="id" , required = true ) int id
			) {
		//store Id 를 통해 1개의 Store 객체를 DB에서 받아온다.
		Store store=storeBO.getStoreById(id);
		
		//StoreId를 바탕으로 그 가게의 리뷰를 받아온다
		List<Review> reviewList=reviewBO.getReviewByStoreId(id);
		
		//리뷰 리스트의 사이즈가 0이면 작성된 리뷰가 없는 것
		if(reviewList.size()==0) {
			model.addAttribute("reviewList","작성된 리뷰가 없습니다.");
			
		// 리스트 사이즈가 0이 아니라면 리뷰 작성이 되어있는 것
		}else{
			model.addAttribute("reviewList",reviewList);
		}
		
		//store이름만
		model.addAttribute("store", store.getStore());
		//list사이즈
		model.addAttribute("listSize",reviewList.size());
		//section에 띄울 아이템을 식별하기위한 값 reviewList==02_section_reviewList.jsp
		model.addAttribute("item", "reviewList");
		
		return "lesson07/00_template";
	}
}
