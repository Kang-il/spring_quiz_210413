package com.quiz.mybatis_select_quiz01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.mybatis_select_quiz01.bo.RealtorBO;
import com.quiz.mybatis_select_quiz01.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealtorController {

	@Autowired
	private RealtorBO realtorBO;
	
	@RequestMapping("/1")
	public String quiz01() {
		return "mybatis_jsp_quiz/addRealtor";
	}
	
	@RequestMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor
			,Model model
			) {
		//TODO:::: INSERT AND SELECT
		realtorBO.addRealtor(realtor);
		
		Realtor resultRealtor=realtorBO.getRealtorById(realtor.getId());
	
		model.addAttribute("subject", "부동산 정보");
		model.addAttribute("result", resultRealtor);
		
		return "mybatis_jsp_quiz/afterAddRealtor";
	}
	
}
