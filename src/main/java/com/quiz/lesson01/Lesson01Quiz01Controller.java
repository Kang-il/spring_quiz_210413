package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody; 


@RequestMapping("/lesson01/quiz01")
@Controller

public class Lesson01Quiz01Controller {
	
	//String 출력하기 return 을 통해 간단한 화면구성하기
	// 요청 URL : http://localhost/lesson01/quiz01/1
	@ResponseBody
	@RequestMapping("/1")
	public String printTest() {
		return "<h1>테스트 프로젝트 완성</h1><h3>해당 프로젝트를 통해서 문제 풀이를 진행합니다</h3>";
	}
	
	//Map JSON 출력하기
	//Map을 통해서 JSON데이터를 출력하기 
	// 요청 URL : http://localhost/lesson01/quiz01/2
	@ResponseBody
	@RequestMapping("/2")
	public Map<String, Integer> printMap(){
		Map<String,Integer> map=new HashMap<>();
		map.put("국어", 80);
		map.put("수학", 90);
		map.put("영어", 85);
		
		return map;
	}
}
