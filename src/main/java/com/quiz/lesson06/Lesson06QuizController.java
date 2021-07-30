package com.quiz.lesson06;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson06.bo.WeatherHistoryBO;
import com.quiz.lesson06.model.WeatherHistory;

@RequestMapping("/lesson06/quiz")
@Controller
public class Lesson06QuizController {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	
	@RequestMapping("/weather_history")
	public String weatherHistoryView(Model model,
			@RequestParam(value="sectionItem",required=false) String sectionItem
			) {
		//css 시간 입력주어 새로고침 시 갱신되도록 하기 위해
		Date date=new Date();
		model.addAttribute("currentTime",date.getTime());
		
		//section item에 무엇을 띄워줄지 결정하는 메서드
		insertsectionItem(model,sectionItem);
		
		return "lesson06/00_template";
	}
	
	
	//날짜 정보를 삽입하는 요청이 왔을 때 처리하는 메서드
	@RequestMapping("/add_weather_history")
	public String quiz02(
				Model model
				,@ModelAttribute WeatherHistory weatherHistory
			) {
		
		//DB 접근
		weatherHistoryBO.addWeatherHistory(weatherHistory);
		
		//section item에 무엇을 띄워줄지 결정하는 메서드 (초기화면으로 돌아갈 수 있도록 menu매개변수에 null을 넣어준다.)
		insertsectionItem(model,null);
		
		//redirect :::: 새로운 request 하는 것과 같으므로 RequestMapping에 있는 path를 써준다.
		return "redirect:/lesson06/quiz/weather_history";
		//return "lesson06/00_template";
	}
	
	
	//section item에 무엇을 띄워줄지 결정하는 메서드
	private void insertsectionItem(Model model, String item) {
		String sectionItem="";
		String subject="";
		
		//item의 값이 null이거나 weatherHistory라면 과거 날짜목록을 띄운다
		if(item==null || item.equals("weatherHistory")) {
			
			List<WeatherHistory> weatherList=weatherHistoryBO.getWeatherHistoryList();
			sectionItem="weatherHistory";
			subject="과거날씨";
			
			//model객체를 통해 DB에서 담아온 weatherHistory 를 view 로 보냄!
			model.addAttribute("weatherList",weatherList);
		
		//item의 값이 insertWeatherHistory라면 날씨를 입력할 수 있는 뷰를 띄운다
		}else if(item.equals("insertWeatherHistory")) {
			sectionItem="insertWeatherHistory";
			subject="날씨입력";
		}
		
		model.addAttribute("subject", subject);
		model.addAttribute("sectionItem",sectionItem);
	}
}
