package com.quiz.mybatis_jsp_quiz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.mybatis_jsp_quiz.bo.SellerBO;
import com.quiz.mybatis_jsp_quiz.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	
	//####quiz 01 seller INSERT
	//--step01. seller INSERT를 하기위한 값들을 받아오기 위한 view페이지로 넘긴다.
	//요청 URL : http://localhost/lesson04/quiz01/1
	@RequestMapping("/1") 
	public String quiz01() {
		return "mybatis_jsp_quiz/addSeller";
	}
	
	//--step02. addSellr.jsp에서 받아온 파라미터 값을 바탕으로 DB에 값을 추가한다
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname
			,@RequestParam(value="profileImageUrl",required=false) String profileImageUrl
			,@RequestParam("temperature")double temperature
			) {
		sellerBO.insertSeller(nickname, profileImageUrl, temperature);
		return "mybatis_jsp_quiz/afterAddSeller";
	}
	
	
	//####quiz02 가장최근에 추가된 seller 의 정보 출력문제
	//요청 URL : http://localhost/lesson04/quiz01/seller_info
	
	//####quiz03 quiz02의 메서드를 재사용하여 id를 파라미터로 받아 해당 seller 출력하기
	//요청 URL : http://localhost/lesson04/quiz01/seller_info?id=...

	@RequestMapping("/seller_info")
	public String quiz02(Model model , @RequestParam(value="id", required=false)Integer id) {
		// id 파라미터를 비필수로 지정하여 id값이 null이라면 가장 최근에 등록된 판매자 정보 받아오기
		//								 null이 아니라면 해당 id값의 판매자 정보 받아오기
		Seller seller=null;
		
		if(id==null) {
			seller=sellerBO.getLastSeller();
		}else {
			seller=sellerBO.getSellerById(id);
		}
		model.addAttribute("subject", "판매자 정보");
		model.addAttribute("result", seller);
		
		return "mybatis_jsp_quiz/sellerInfo";
	}

	
	
}
