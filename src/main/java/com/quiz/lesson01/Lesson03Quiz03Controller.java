package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson03Quiz03Controller {

	@RequestMapping("/lesson01/quiz03/1")
	//ResponseBody가 아닌상태로 String이 리턴된다면 
	//ViewResolver가 기본으로 작동되어 해당이름을 가지는 view파일(jsp)의 경로를 찾아감
	public String quiz03_01() {
		//http://localhost/WEB-INF/jsp/lesson01/quiz03_1.jsp
		return "lesson01/quiz03_1";
	}
	
}
