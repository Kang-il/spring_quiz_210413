package com.quiz.mybatis_select_quiz01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quiz.mybatis_select_quiz01.bo.RealtorBO;
import com.quiz.mybatis_select_quiz01.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealtorController {

	@Autowired
	private RealtorBO realtorBO;
	
	// 요청 URL : http://localhost/lesson04/quiz02/1
	@RequestMapping("/1")
	public String quiz01() {
		return "mybatis_jsp_quiz/addRealtor";
	}
	
	
	// 요청 URL : http://localhost/lesson04/quiz02/addrealtor
	@RequestMapping(path="/add_realtor",method=RequestMethod.POST)//post 방식으로만 이 주소로 접근 할 수 있음.
	public String addRealtor(
			@ModelAttribute Realtor realtor
			,Model model
			) {
		//1. 파라미터를 받는다(DB에 INSERT할 realtor 값을 
		// modelAttribute Annotation을 통해 Realtor객체에 자동으로 저장한다. 
		
		//TODO:::: INSERT AND SELECT
		
		//2. DB INSERT 한다.
		realtorBO.addRealtor(realtor);
		
		//3. DB SELECT를 해와서 VIEW 페이지에 넣는다 -- RESPONSE
		Realtor resultRealtor=realtorBO.getRealtorById(realtor.getId());
	
		model.addAttribute("subject", "부동산 정보");
		model.addAttribute("result", resultRealtor);
		
		return "mybatis_jsp_quiz/afterAddRealtor";
	}
	
}
